class Website < ApplicationRecord
  has_many  :collection_websites
  has_many  :collections, through: :collection_websites
  has_many  :alexaranks, dependent: :destroy
  validates :url, presence: true
  validates_uniqueness_of :url

  def fetch_alexa_rank_and_update!
    rank = Alexarank.fetch_rank(domain: url.to_s)
    alexaranks.create(rank: rank)

  rescue Exception => e
    Rails.logger.info "[AFE] #{url} rank fetch failed."
    Rails.logger.info "[AFE] #{e.message}"
  end

  def fetch_last_10_days_rank
    alexaranks.where('created_at >= ?',
                     Date.current - 10.days)
              .order('created_at ASC')
  end

  def self.fetch_metadescription(domain:, website:)
    url = if (domain.include? 'http://') || (domain.include? 'https://')
            domain
          else
            'http://' + domain
          end
    descript = Nokogiri::HTML(open(url))
    meta = descript.search("meta[name='description']").map { |n| n['content'] }
    website.update_attribute(:description, meta)
  end
end

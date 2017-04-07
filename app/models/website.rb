class Website < ApplicationRecord
  before_validation :add_protocol_to_website

  validates :url, url: true

  has_many  :collection_websites
  has_many  :collections, through: :collection_websites
  has_many  :alexaranks, dependent: :destroy

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

  def fetch_meta_description
    # TODO: Mock this method in tests
    return if Rails.env.test?

    url = if (self.url.start_with? 'http://') || (self.url.start_with? 'https://')
            self.url
          else
            "http://#{self.url}"
          end
    page = Nokogiri::HTML(open(url))
    description = page.search("meta[name='description']").map { |n| n['content'] }
    update(description: description)
  end

  private

  def add_protocol_to_url
    return if protocol_present?
    self.url = "https://#{url}"
  end

  def protocol_present?
    return false if url.blank?
    url[/^http:\/\//] || url[/^https:\/\//]
  end
end

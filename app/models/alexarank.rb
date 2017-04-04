class Alexarank < ApplicationRecord
  belongs_to :website

  scope :timeline, -> { order(created_at: :desc) }
  scope :for_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }

  def self.fetch_rank(domain:)
    alexa_link  = 'http://www.alexa.com/siteinfo/' + domain
    doc         = Nokogiri::HTML(open(alexa_link))
    rank        = doc.css('strong.metrics-data.align-vmiddle')
                     .inner_text.to_s.delete(',')
                     .split
                     .first
    rank.to_i
  end
end

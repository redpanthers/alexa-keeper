module WebsitesHelper
  def self.createJSON(alexaRank)
    series_data = []
    alexaRank.each do |site|
      series_data << { name: site.created_at.to_s, data: [site.rank.to_i] } 
    end
    alexaRank
  end
end

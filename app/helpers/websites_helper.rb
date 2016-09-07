require 'json'
module WebsitesHelper
  def self.createJSON(alexaRank, url)
    dates = []
    ranks = []
    alexaRank.each do |site|
      rank_date_pair  = []
      rank_date_pair << site.created_at.to_s[0..9]
      rank_date_pair << site.rank.to_i
      ranks          << rank_date_pair
      dates          << site.created_at.to_s[0..9]
    end
    series            = []
    series           << { :name => url, :data => ranks}
    res               = {}
    res['title']      ={:text       =>'Alexa Rank'}
    res['xAxis']      ={:categories => dates.uniq,
                        :title      => {text: 'Date(YYYY-mm-dd)'}
                        }
    res['yAxis']      ={:title      => { :text => 'Alexa Rank'},
                        :labels     =>{},
                        :plotLines  =>[{:value => 0,
                                 :width => 1,
                                 :color => '#808080'
                                }]}
    res['series']      = series
    res.to_json
  end
end

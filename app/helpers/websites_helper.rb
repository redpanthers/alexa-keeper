require 'json'
module WebsitesHelper
  def self.createJSON(website)
    alexaRank = website.fetch_last_10_days_rank
    url   = website.url
    dates = []
    ranks = []
    alexaRank.each do |site|
      rank_date_pair  = []
      rank_date_pair << site.created_at.strftime('%Y-%m-%d')
      rank_date_pair << site.rank
      ranks          << rank_date_pair
      dates          << site.created_at.strftime('%Y-%m-%d')
    end
    series            = []
    series           << { :name => url, :data => ranks}
    res               = {}
    res['title']      ={:text       =>'Alexa Rank'}
    res['xAxis']      ={:categories => dates.uniq,
                        :title      => {text: 'Date(YYYY-mm-dd)'}
                        }
    res['yAxis']      ={:reversed   => 'true',
                        :title      => { :text => 'Alexa Rank'},
                        :labels     =>{},
                        :plotLines  =>[{:value => 0,
                                 :width => 1,
                                 :color => '#808080'
                                }]}
    res['series']      = series
    res.to_json
  end
end

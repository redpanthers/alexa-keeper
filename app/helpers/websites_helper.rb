require 'json'
module WebsitesHelper
  def self.createJSON(alexaRank)
    dates = []
    ranks = []
    alexaRank.each do |site|
      ranks << site.rank.to_i
      dates << site.created_at.to_s 
    end
    demo_series = []
    demo_series << { :name =>'RedPanthers', :data => ranks}
    res = {}
    res['title']={:text=>'Alexa Rank'}
    res['xAxis']={:categories => dates }
    res['yAxis']={:title => { :text => 'Alexa Rank'},
                  :plotLines =>[{:value => 0,
                                 :width => 1,
                                 :color => '#808080'
                                }]}
    res['series'] = demo_series
    res.to_json
  end
end

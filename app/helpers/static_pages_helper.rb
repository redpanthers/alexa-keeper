module StaticPagesHelper
  def self.createJSON(website)
    series = []
    website.each do |site|
      demo_series = {}
      ranks = []
      dates  = []
      site.alexaranks.each do |rank|
        ranks << rank.rank.to_i
        dates << rank.created_at.to_s[0..10]
      end
      demo_series = { :name => site.url, :data => ranks, :date => dates }
      series.push(demo_series)
    end
    series = series.map{ |o| Hash[o.each_pair.to_a]}
  end
end

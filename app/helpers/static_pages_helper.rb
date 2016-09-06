module StaticPagesHelper
  def self.createJSON(website)
    series = []
    website.each do |site|
      demo_series = {}
      ranks = []
      data  = []
      category = []
      site.alexaranks.each do |rank|
        create_data = {}
        category << rank.created_at.to_s[0..10]
        create_data = {:name => rank.created_at.to_s[0..10], :y => rank.rank.to_i}
        data.push(create_data)
      end
      demo_series = { :name => site.url, :data => data, :date => category }
      series.push(demo_series)
    end
    series = series.map{ |o| Hash[o.each_pair.to_a]}
  end
end

class LaxBracket::OriginalRank
  attr_accessor :name, :rank

  def self.all
    self.scrape_ncaa_ranks
  end

  # def self.scrape_original_ranks
  #   @original_ranks = []
  #   #go to https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches, extract the properties, #initiate the list, #print the list
  #   @original_ranks << self.scrape_ncaa_ranks
  #   @original_ranks
  # end

  def self.scrape_ncaa_ranks
    doc = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))
    @teams = []
    team = self.new

    #binding.pry

    doc.search("tbody").each do |team_info|
      team.name = team_info.css("tr td")[1].text
      team.rank = team_info.css("tr td")[0].text
      @teams << team
    end

    @teams

  end

end

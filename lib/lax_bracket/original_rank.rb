class LaxBracket::OriginalRank
  attr_accessor :name, :pre_rank

  def self.all
    self.scrape_ncaa_ranks
  end

  def self.scrape_ncaa_ranks
    doc = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))
    @teams = []

    doc.search("tbody tr").each do |team_info|
      team = self.new
      team.name = team_info.css("td")[1].text.gsub(/\s[(]..[)]/, "").gsub(/\s[(].[)]/, "")
      team.pre_rank = team_info.css("td")[0].text
      @teams << team
    end

    @teams
    #binding.pry
  end

end

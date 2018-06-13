class LaxBracket::PreRank
  attr_accessor :name, :pre_rank

  def self.all
    self.scrape_ncaa_ranks
  end

  def self.scrape_ncaa_ranks
    doc = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))
    @teams = []

    doc.search("tbody tr").each do |team_info|
      team = self.new
      team_name_scrape = team_info.css("td")[1].text.gsub(/\s[(].*[)]/, "").upcase
      if team_name_scrape == "CLAREMONT-MUDD-SCRIPPS"  #because of discrepancies in ncaa.com
        team.name = "CLAREMONT-M-S"
      elsif team_name_scrape == "FRANKLIN & MARSHALL"
        team.name = "FRANK. & MARSH."
      elsif team_name_scrape == "WASHINGTON AND LEE"
        team.name = "WASHINGTON & LEE"
      elsif team_name_scrape == "STEVENS"
        team.name = "STEVENS INST."
      else
        team.name = team_name_scrape
      end
      team.pre_rank = team_info.css("td")[0].text
      @teams << team
    end

    @teams
    #binding.pry
  end

end

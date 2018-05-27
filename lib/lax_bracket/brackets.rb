#class DailyDeal::Deal
class LaxBracket::Brackets
  attr_accessor :name, :teams, :winner, :url

  def self.all
    # Scrape ncaa and return brackets based on that data

    self.scrape_brackets
  end

  def self.scrape_brackets
    brackets = []
    #go to NCAA, find the brackets,
    #extract the properties
    #initiate a bracket

    # bracket_1 = self.new
    # bracket_1.name = "Bracket #1"
    # bracket_1.teams = ["Trinity", "Springfield", "Salisbury"]
    # bracket_1.winner = "Salisbury"
    # bracket_1.url = "https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"
    #
    # bracket_2 = self.new
    # bracket_2.name = "Bracket #2"
    # bracket_2.teams = ["Tufts", "Bowdoin", "TCNJ"]
    # bracket_2.winner = "TCNJ"
    # bracket_2.url = "https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"
    #
    # [bracket_1, bracket_2]
    brackets
  end

  def self.scrape_ncaa
    doc = Nokogiri::HTML(open("https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"))
    binding.pry
  end
end

#class DailyDeal::Deal
class LaxBracket::Brackets
  attr_accessor :name, :teams, :winner, :url, :games

  def self.all
    # Scrape ncaa and return brackets based on that data

    self.scrape_brackets
  end

  def self.scrape_brackets
    @brackets = []
    #go to NCAA, find the brackets,
    #extract the properties
    #initiate a bracket
    @brackets << self.scrape_ncaa
    @brackets << self.scrape_ncaa

    @brackets << self.scrape_ncaa
    @brackets << self.scrape_ncaa

    # bracket_1 = self.new
    # bracket_1.name = "Bracket #1"
    # bracket_1.teams = ["Trinity", "Springfield", "Salisbury"]
    # bracket_1.winner = "Salisbury"
    # bracket_1.url = "https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"
    @brackets
  end

  def self.scrape_ncaa
    doc = Nokogiri::HTML(open('https://www.ncaa.com/interactive-bracket/lacrosse-women/d3'))

    bracket = self.new
    bracket.name = "Bracket ##{@brackets.length + 1}"
    #doc.search("h1.element-invisible").text
    bracket.teams = ["team 1", "team 2", "team 3"]
    if bracket.name = "Bracket #1"
      bracket.games = []
      doc.search("#bracket-top-left h3.element-invisible").each do |game|

        game_teams = game.text
        game_score = "9 to 10"
        game_round = "round #"
        bracket.games << {game_round => [game_teams, game_score]}

      end
    end
    bracket.winner = doc.search("h2").text
    bracket.url = doc.search("h2").first.attr("href")
    bracket
  #  binding.pry
  end
end

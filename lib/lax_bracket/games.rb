class LaxBracket::Games
  attr_accessor :id, :title, :winner, :loser, :score
  def self.all
    self.scrape_games
  end

  def self.scrape_games
    doc = Nokogiri::HTML(open('https://www.ncaa.com/interactive-bracket/lacrosse-women/d3'))

    game = self.new
    game

  end
end

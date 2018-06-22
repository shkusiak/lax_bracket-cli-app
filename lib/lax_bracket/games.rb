class LaxBracket::Games
  #attr_accessor :id, :title, :winner, :loser, :score, :round, :bracket
  @@all = []

  def self.all
    @@all = LaxBracket::Scraper.games
  end

end

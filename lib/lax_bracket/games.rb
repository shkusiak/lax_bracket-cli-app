class LaxBracket::Games
  @@all = []

  def self.all
    @@all = LaxBracket::Scraper.games
  end

end

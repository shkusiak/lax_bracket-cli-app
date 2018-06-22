class LaxBracket::Scraper
  @@games = []
  @@pre_rank = []

  def self.scrape_games
    @scrape_rankings_url = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))
  end

  def self.scrape_pre_ranks
    @scrape_games_url = Nokogiri::HTML(open('https://www.ncaa.com/interactive-bracket/lacrosse-women/d3'))
  end

  def self.games
    self.scrape_games
  end

  def self.pre_ranks
    self.scrape_pre_ranks
  end

end

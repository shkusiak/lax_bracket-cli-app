class LaxBracket::PreRank
  @@all = []

  def self.all
    @@all = LaxBracket::Scraper.pre_ranks
  end

end

class LaxBracket::PreRank
#  attr_accessor :name, :pre_rank
  @@all = []

  def self.all
    @@all = LaxBracket::Scraper.pre_ranks
  end

end

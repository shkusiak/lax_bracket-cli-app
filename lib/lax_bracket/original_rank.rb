class LaxBracket::OriginalRank
  attr_accessor

  def self.all
    self.scrape_original_ranks
  end

  def self.scrape_original_ranks
    @original_ranks = []
    #go to https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches
    #extract the properties
    #initiate the list
    #print the list

    @original_ranks << self.scrape_ncaa_ranks

    @original_ranks
  end

  def self.scrape_ncaa_ranks
    doc = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))


  end

end

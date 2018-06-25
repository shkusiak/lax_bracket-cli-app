class LaxBracket::Games
  # *** All notes here apply equally to the PreRank class ***
  # we're not really using this class variable, or this
  # class, effectively.  See further notes below.

  # Also, very minor, but Ruby convention is for model classes to be
  # declared using singular noun, in this case, `Game` instead of `Games`

  @@all = []

  # consider building an #initialize method that saves
  # the instance of the Games class being created to
  # the @@all array, such as
  # def initialize
    # self.save
  # end
  # Further, your #initialize method could take in a list or hash of arguments for assignment upon creation:
  # def initialize([...attribute_hash or list of attributes as arguments...])
  #   ... assign attributes here
  #   self.save
  # end

  # This method should just expose @@all, and not reference
  # the Scraper class at all
  def self.all
    @@all = LaxBracket::Scraper.games
  end

  # #save could be an instance method that just saves
  # an instance of Games into @all, such as
  # def save
  #   @@all << self
  # end

end

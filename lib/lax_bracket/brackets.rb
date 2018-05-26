#class DailyDeal::Deal
class LaxBracket::Brackets
  def self.all
    #I should return a bunch of insances of brackets
    puts <<-DOC.gsub /^\s*/, ''
      Bracket #1:
        1. Trinity
        2. etc.
      Bracket #2:
        1. Middlebury
        2. etc.
      Bracket #3:
        1. Salisbury
        2. etc.
      Bracket #4:
        1. Amherst
        2. etc.
    DOC
  end
end

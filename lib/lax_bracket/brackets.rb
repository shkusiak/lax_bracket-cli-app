#class DailyDeal::Deal
class LaxBracket::Brackets
  attr_accessor :name, :teams, :winner, :url

  def self.all
    #I should return a bunch of insances of brackets
    puts <<-DOC.gsub /^\s*/, ''
      Bracket #1:
        1. Trinity
        2. Middlebury
        3. Salisbury
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
    bracket_1 = self.new
    bracket_1.name = "Bracket #1"
    bracket_1.teams = ["Trinity", "Springfield", "Salisbury"]
    bracket_1.winner = "Salisbury"
    bracket_1.url = "https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"

    bracket_2 = self.new
    bracket_2.name = "Bracket #2"
    bracket_2.teams = ["Tufts", "Bowdoin", "TCNJ"]
    bracket_2.winner = "TCNJ"
    bracket_2.url = "https://www.ncaa.com/interactive-bracket/lacrosse-women/d3"

    [bracket_1, bracket_2]
  end


end


#Our CLI Controller

class LaxBracket::CLI

  def call
    list_brackets
    menu
    goodbye
  end

  def list_brackets
    puts "Lacrosse Bracket includes:"
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts <<-DOC.gsub /^\s*/, ''
      Bracket #1:
        1. Trinity
        2. Amherst
        3. etc.
      Bracket #2:
        1. Middlebury
        2. Salisbury
        3. etc.
      Bracket #3:
        1. Trinity
        2. Amherst
        3. etc.
      Bracket #4:
        1. Middlebury
        2. Salisbury
        3. etc.
    DOC
  end

  def menu

    input = nil
    while input != "exit"
      puts "Enter the number of the team you would like more info on or type exit to exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on team 1..."
      when "2"
        puts "more info on team 2.."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!!!"
  end
end

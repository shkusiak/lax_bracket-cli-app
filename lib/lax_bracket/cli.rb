
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
    @brackets = LaxBracket::Brackets.all
    #@deals = DailyDeal::Deal.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the team you would like more info on or type list to see the teams again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on team 1..."
      when "2"
        puts "more info on team 2.."
      when "list"
        list_brackets
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more deals!!!"
  end
end


#Our CLI Controller

class LaxBracket::CLI

  def call
    #list_top_teams
    list_brackets
    menu
    goodbye
  end

  def list_brackets
    puts "Lacrosse Bracket includes:"
    @brackets = LaxBracket::Brackets.all
    @brackets.each do |bracket|
      puts "#{bracket.name}:"
      bracket.teams.each.with_index(1) do |team, i|
        puts "#{i}. #{team}"
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the bracket you would like more info on or type list to see the brackets again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_bracket = @brackets[input.to_i-1]
        puts "#{the_bracket.name}:"
        the_bracket.teams.each.with_index(1) do |team, i|
          puts "#{i}. #{team}"
        end
      elsif input == "list"
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

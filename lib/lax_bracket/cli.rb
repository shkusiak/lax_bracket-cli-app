
#Our CLI Controller

class LaxBracket::CLI
  attr_accessor :pre_ranks, :games
  @pre_ranks = []
  def call
    games
    #list_pre_rank
    #menu
    #goodbye
  end

  def games
    @games = LaxBracket::Games.all
    @games
  end

  def list_pre_rank
    puts "Prior to playoffs, the rankings were:"
    @pre_ranks = LaxBracket::OriginalRank.all

    @pre_ranks.each do |team|
      puts "#{team.pre_rank}. #{team.name}"
    end
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the team you would like more info on or type 'brackets', 'results', 'pre rankings' or 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        # the_bracket = @brackets[input.to_i-1]
        # puts "#{the_bracket.name}:"
        # the_bracket.teams.each.with_index(1) do |team, i|
        #   puts "#{i}. #{team}"
        # end
        @pre_ranks.each do |team|
          if input == team.pre_rank
            puts "more info on #{team.name}..."
          end
        end


      elsif input == "brackets"
        list_brackets
      elsif input == "pre rankings"
        list_pre_rank
      elsif input == "results"
        list_results
      elsif input == "exit"
      else
        puts "Not sure what you want, type 'brackets', 'results', or 'exit'."
      end
    end
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

  def follow_team
    puts "now you are following a team"
  end

  def list_results
    puts "here are the results"
  end

  def goodbye
    puts "type './bin/lax-bracket' to run the program again."
  end
end


#Our CLI Controller

class LaxBracket::CLI
  attr_accessor :pre_ranks, :games
  @pre_ranks = []
  def call
    #games
    #follow_team
    list_pre_rank
    menu
    #goodbye
  end

  def games
    @games = LaxBracket::Games.all
    #@games
  end

  def list_pre_rank
    puts "Prior to playoffs, the rankings were:"
    @pre_ranks = LaxBracket::OriginalRank.all

    @pre_ranks.each do |team|
      puts "#{team.pre_rank}. #{team.name}"
    end
    games
  end


  def menu
    input = nil
    while input != "exit"
      puts "Type 'follow team', 'brackets', 'results', 'pre rankings' or 'exit':"
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
      elsif input == "follow team"
        follow_team
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
    puts "Please type the name of the team you would like to follow."
    input = gets.strip

    @games.each do |game|
      if game.winner == input
        puts "#{input} played #{game.loser} during the #{game.round} and won. The final score was #{game.score}."
      elsif game.loser == input
        puts "#{input} played #{game.winner} during the #{game.round} and lost. The final score was #{game.score}."
      end
    end

  end

  def list_results
    puts "here are the results"
  end

  def goodbye
    puts "type './bin/lax-bracket' to run the program again."
  end
end

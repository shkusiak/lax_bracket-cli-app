
#Our CLI Controller

class LaxBracket::CLI
  attr_accessor :pre_ranks, :games, :results
  @pre_ranks = []
  def call
    #games
    #follow_team
    list_pre_rank
    menu
    goodbye
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
      puts "Please type 1. follow team, 2. brackets, 3. results, 4. pre rankings or 5. exit:"
      puts ""
      input = gets.strip.downcase

      if input == "follow team" || input == "1"
        follow_team
      elsif input == "brackets" || input == "2"
        list_brackets
      elsif input == "results" || input == "3"
        list_results
      elsif input == "pre rankings" || input == "4"
        list_pre_rank
      elsif input == "exit" || input == "5"
        goodbye
      else
        puts "Not sure what you want,"
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
    puts ""
    @pre_ranks.each do |team|
      if team.name == input
        if team.pre_rank.to_i == 1
          puts "Prior to playoffs, #{team.name} was in #{team.pre_rank}st place"
        elsif team.pre_rank.to_i == 2
          puts "Prior to playoffs, #{team.name} was in #{team.pre_rank}nd place"
        elsif team.pre_rank.to_i == 3
          puts "Prior to playoffs, #{team.name} was in #{team.pre_rank}nd place"
        else
          puts "Prior to playoffs, #{team.name} was in #{team.pre_rank}th place"
        end
      end
    end
    @games.each do |game|
      if game.winner == input
        puts "#{input} played #{game.loser} during the #{game.round} and won. The final score was #{game.score}."
      elsif game.loser == input
        puts "#{input} played #{game.winner} during the #{game.round} and lost. The final score was #{game.score}."
      end
    end
    puts "Their final rank is: "
  end

  def list_results
    @results = []
    @games.each do |game|
      if game.round == "Championships"
        results << game.winner
        results << game.loser
      elsif game.round == "Semifinals"
        results << game.loser
      elsif game.round == "Quarterfinals"
        results << game.loser
      elsif game.round == "Third Round"
        results << game.loser
      elsif game.round == "Second Round"
        results << game.loser
      elsif game.round == "First Round"
        results << game.loser
      end
    end
    @results = @results.reverse
    @results.each.with_index(1) do |team, i|

      puts "#{i}. #{team}"

    end
    #puts "here are the results"
  end

  def goodbye
    puts "type './bin/lax-bracket' to run the program again."
    puts ""
  end
end

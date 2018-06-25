class LaxBracket::CLI
  attr_accessor :pre_ranks, :games, :results

  def call
    LaxBracket::Scraper.scrape_games
    LaxBracket::Scraper.scrape_pre_ranks
    list_pre_rank
    menu
    goodbye
  end

  # If you're going to have an instance variable to hold
  # all the games, use the getter method that you've built
  # here when you're referencing it..  You could, though,
  # just refer to LaxBracket::Games.all each time.
  def games
    @games = LaxBracket::Games.all
  end

  def list_pre_rank
    puts ""
    puts "Welcome to the 2018 NCAA D3 Women's Lacrosse Playoffs"
    puts "Prior to playoffs, the rankings were:"
    @pre_ranks = LaxBracket::PreRank.all

    @pre_ranks.each do |team|
      puts "#{team.pre_rank}. #{team.name}"
    end
    puts ""
    games
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please type 1. follow team, 2. brackets, 3. results, 4. pre rankings or exit:"
      puts ""
      input = gets.strip.downcase

      if input == "follow team" || input == "1"
        puts ""
        follow_team
      elsif input == "brackets" || input == "2"
        puts ""
        list_brackets
      elsif input == "results" || input == "3"
        puts ""
        list_results
      elsif input == "pre rankings" || input == "4"
        list_pre_rank
      elsif input == "exit"
        #goodbye
      else
        puts "Not sure what you want,"
      end
    end
  end


  def follow_team
    puts "Please type the name of the team you would like to follow."
    puts ""
    input = gets.strip.upcase
    puts ""
    # Might be nice to build a class finder method for PreRank, such as
    # LaxBracket::PreRank.find_by_team(team) rather than filtering them
    # here in the `if` statement
    @pre_ranks.each do |team|
      if team.name == input
        puts "Prior to playoffs, #{team.name}'s rank was: #{team.pre_rank}"
      end
    end
    @games.each do |game|
      if game.winner == input
        puts "#{input} played #{game.loser} during the #{game.round} and won. The final score was #{game.score}."
      elsif game.loser == input
        puts "#{input} played #{game.winner} during the #{game.round} and lost. The final score was #{game.score}."
      end
    end
    calc_results
    if @results.include?(input)
      if @results.index(input)+1 == 1
        puts "#{input} IS THE CHAMPION!"
      elsif @results.index(input)+1 == 2
        puts "#{input} IS THE RUNNER UP!"
      elsif @results.index(input)+1 == 3
        puts "#{input} CAME IN THIRD!"
      else
        puts "Their final rank is: #{@results.index(input)+1}"
      end
    else
      puts "#{input} did not make it to playoffs" #not all teams make it to playoffs
    end
    puts ""
  end

  def calc_results
    @results = []
    @games.each do |game|
      if game.round == "Championships"
        results << game.loser
        results << game.winner
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
  end

  def list_results
    calc_results
    puts "The final rankings are:"
    @results.each.with_index(1) do |team, i|
      puts "#{i}. #{team}"
    end
    puts ""
  end


  def list_brackets
    @bracket_1 = []
    @bracket_2 = []
    @bracket_3 = []
    @bracket_4 = []

    @games.sort_by {|game| game.id}.reverse.each do |game|
      if game.bracket == 1
        @bracket_1 << game.winner  if !@bracket_1.include?(game.winner)
        @bracket_1 << game.loser if !@bracket_1.include?(game.loser)
      elsif game.bracket == 2
        @bracket_2 << game.winner  if !@bracket_2.include?(game.winner)
        @bracket_2 << game.loser  if !@bracket_2.include?(game.loser)
      elsif game.bracket == 4
        @bracket_3 << game.winner  if !@bracket_3.include?(game.winner)
        @bracket_3 << game.loser  if !@bracket_3.include?(game.loser)
      elsif game.bracket == 5
        @bracket_4 << game.winner  if !@bracket_4.include?(game.winner)
        @bracket_4 << game.loser  if !@bracket_4.include?(game.loser)
      end
    end

    puts "The brackets are:"

    puts "Bracket #1:"
    @bracket_1.each.with_index(1) do |team, i|
      if i == 1
        puts "#{i}. #{team}     <-- BRACKET WINNER"
      else
        puts "#{i}. #{team}"
      end
    end

    puts   "Bracket #2:"
    @bracket_2.each.with_index(1) do |team, i|
      if i == 1
        puts "#{i}. #{team}     <-- BRACKET WINNER"
      else
        puts "#{i}. #{team}"
      end
    end

    puts   "Bracket #3:"
    @bracket_3.each.with_index(1) do |team, i|
      if i == 1
        puts "#{i}. #{team}     <-- BRACKET WINNER"
      else
        puts "#{i}. #{team}"
      end
    end

    puts   "Bracket #4:"
    @bracket_4.each.with_index(1) do |team, i|
      if i == 1
        puts "#{i}. #{team}     <-- BRACKET WINNER"
      else
        puts "#{i}. #{team}"
      end
    end
    puts ""
  end

  def goodbye
    puts ""
    puts "type './bin/lax-bracket' to run the program again."
    puts ""
  end
end

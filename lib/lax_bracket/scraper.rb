class LaxBracket::Scraper
  attr_accessor :id, :title, :winner, :loser, :score, :round, :bracket, :name, :pre_rank
  @@games = []
  @@pre_ranks = []


  def self.scrape_games
    doc = Nokogiri::HTML(open('https://www.ncaa.com/interactive-bracket/lacrosse-women/d3'))

    brackets = 0

    doc.search("#bracket-section .bracket-region").each do |bracket|
      brackets += 1

      bracket.search(".game-set.game-pos").each do |new_game|
        game = self.new

        game.bracket = brackets
        game.id = new_game.search("div.bracket-game").text
        game.title = new_game.search("h3").text
        game.winner = new_game.search("div.winner .team-name").text.gsub(/\s[(].*[)]/,"").upcase

        if game.winner == new_game.search("div.team-info.info-top .team-name").text.gsub(/\s[(].*[)]/,"").upcase
          game.loser = new_game.search("div.team-info.info-bottom .team-name").text.gsub(/\s[(].*[)]/,"").upcase
        else
          game.loser = new_game.search("div.team-info.info-top .team-name").text.gsub(/\s[(].*[)]/,"").upcase
        end

        top_score = new_game.search("div.team-info.info-top .team-score").text
        bottom_score = new_game.search("div.team-info.info-bottom .team-score").text
        game.score = "#{top_score}-#{bottom_score}"


        if game.id.to_i > 600
          game.round = "Championships"
        elsif game.id.to_i > 500
          game.round = "Semifinals"
        elsif game.id.to_i > 400
          game.round = "Quarterfinals"
        elsif game.id.to_i > 300
          game.round = "Third Round"
        elsif game.id.to_i > 200
          game.round = "Second Round"
        else
          game.round = "First Round"
        end

        @@games << game
      end
    end

    @@games = @@games.sort_by {|game| game.id}

    @@games

  end

  def self.scrape_pre_ranks
    doc = Nokogiri::HTML(open('https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches'))

    doc.search("tbody tr").each do |team_info|
      team = self.new
      team_name_scrape = team_info.css("td")[1].text.gsub(/\s[(].*[)]/, "").upcase

      if team_name_scrape == "CLAREMONT-MUDD-SCRIPPS"  #because of discrepancies in ncaa.com
        team.name = "CLAREMONT-M-S"
      elsif team_name_scrape == "FRANKLIN & MARSHALL"
        team.name = "FRANK. & MARSH."
      elsif team_name_scrape == "WASHINGTON AND LEE"
        team.name = "WASHINGTON & LEE"
      elsif team_name_scrape == "STEVENS"
        team.name = "STEVENS INST."
      else
        team.name = team_name_scrape
      end

      team.pre_rank = team_info.css("td")[0].text
      @@pre_ranks << team
    end

    @@pre_ranks
  end

  def self.games
    @@games
  end

  def self.pre_ranks
    @@pre_ranks
  end

end

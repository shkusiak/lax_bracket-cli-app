class LaxBracket::Games
  attr_accessor :id, :title, :winner, :loser, :score, :round, :bracket
  @@all = []

  def self.all
    self.scrape_games
  end

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

        @@all << game
      end
    end
    @@all = @@all.sort_by {|game|
    game.id}

    @@all

  end
end

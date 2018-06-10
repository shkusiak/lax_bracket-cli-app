# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application - a CLI interfaces  has been made for this project. By typing ./bin/lax-bracket, a user will be prompted with this interface.
- [x] Pull data from an external source - I used Nokogiri and open-uri to scrape through ncaa.com to pull the history of the 2018 DIII Women's Lacrosse bracket. This data was scraped in games.rb and original_rank.rb.
- [x] Implement both list and detail views - There are three different lists generated in this program: Pre-rankings, Results and Brackets. Through these lists, the user can follow a team to show details of how they did during playoffs.

<> How to Build a CLI Gemfile --

    1. Plan your gem, imagine your interface
    2. Start with the project structure - google
    3. Start with the entry point - the file run
    4. Force that to build the CLI interface
    5. stub out the interface
    6. Start making things real
    7. discover objects
    8. program


<> A command line interface for the lacrosse bracket --

    user types lax-bracket

    Show a list of teams & brackets
      Bracket #1:
      1. Trinity
      2. Amherst
      3. etc.

    Which bracket do you want to learn more about?

    1

    "<bracket_1> consists of:
      [Team 1, Team 2, etc.]
    The winner of Bracket 1 is <bracket_winner>"
    Which team do you want to learn more about? Type the number of the team you would like to learn more about.

    Team 1

    Shows more info on team 1
     "<team 1> came in <rank> place overall.
     They played <team> during <round> and <won/lost>. The final score was <score>.
     Then they played <team> during <round> and <won/lost>. The final score was <score>.
     Then they played..."

    To see a final rank of all teams type "rankings"

     Shows a list of the final rankings:
       1. Midddlebury
       2. TCNJ
       3. etc.

<> DEFINING OBJECTS --

    What is a bracket?
     A bracket has a name
     A bracket has a list of teams
     A bracket has a winner -- overall winner(?)
     A bracket has rounds

    What is a round?
      A round has a name
      A round has a date
      A round has a game or games
      A round has a winner or winners -- through games(?)
      belongs to brackets

    What is a game?
      A game has (2) teams
      A game has a score
      A game has a winner
      A game has a location (?)
      Belongs to a round

    What is a team?
      A team has a name
      A team has a rank
      A team has a history of games (including scores and opponents)

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

    Execute pre_rank

      Show a list of the top 25 teams prior to playoffs.
        1. TCNJ
        2. Amherst
        3. Salisbury
        ...
      Execute playoffs

    Ask the user what they would like to do?
      >options: list_results, follow_team, list_brackets, exit, or list_pre_rank

    IF list_results, shows a list of the final rankings:
       1. Midddlebury
       2. TCNJ
       3. etc.

      What would you like to do next?
        >options: list_pre_rank, follow_team, list_brackets, exit


    IF follow_team ask for a team name

      >team_1

      Shows more info on <team_1>
        "<team 1.name> came in <team_1.rank> place overall. (Their original rank was <team_1.original_rank or original_rank(team_1)?>.)
        They played <team> during <round> and <won/lost>. The final score was <score>.
        Then they played <team> during <round> and <won/lost>. The final score was <score>.
        Then they played...
        ..."

      What would you like to do next?
        >options: list_pre_rank, list_results, follow_team, list_brackets, exit

    IF list_brackets, show a list of teams & brackets

      Bracket #1:
        1. Trinity
        2. Amherst
        3. etc.

      Which "bracket" do you want to learn more about?

      >1

      Shows more info on <bracket_1>
        "<bracket_1.name> consists of:
          [Team 1, Team 2, etc.]
        The winner of Bracket 1 is <bracket_1.winner>
        Which "team" do you want to learn more about? Type the number of the team you would like to learn more about."

      >Team 1

      execute follow_team(team_1)

      What would you like to do next?
        >options: list-pre_rank, list_results, follow_team, list_brackets, exit


<> DEFINING OBJECTS --
    What is pre_rank?
     Original Rank comes from: https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches
     Consists of top 25 teams only

    What is a bracket?
     A bracket has a name - there are 4 brackets
     A bracket has games
     A bracket has a list of teams -- through games?
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
      A team can have an original rank (if top 25 teams)
      A team has an end rank
      A team has a history of games (including scores and opponents)

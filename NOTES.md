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

    user types lax-bracket or ./bin/lax-bracket

    Execute list_pre_rank

      Show a list of the top 25 teams prior to playoffs.
        1. TCNJ
        2. Amherst
        3. Salisbury
        ...

    Execute menu

      What would you like to do?
        >options: list_results, follow_team, list_brackets, list_pre_rank, or exit

    IF input == list_results, shows a list of the final rankings:
       1. Gettysburg
       2. Midddlebury
       3. TCNJ
       4. etc.

    Execute menu

      What would you like to do next?
        >options: list_results, follow_team, list_brackets, list_pre_rank, or exit


    IF input == follow_team ask for a team name

      >team_1

      Shows more info on <team_1>
        "Prior to playoffs, <team_1.name> rank was <team_1.original_rank>.
        They played <team> during <round> and <won/lost>. The final score was <score>.
        Then they played <team> during <round> and <won/lost>. The final score was <score>.
        Then they played...
        ...
        <team_1.name> final rank was: <team_1.rank>"

    Execute menu

      What would you like to do next?
        >options: list_results, follow_team, list_brackets, list_pre_rank, or exit


    IF input == list_brackets, show a list of teams & brackets

      Bracket #1:
        1. Trinity
        2. Salisbury
        3. etc.
      Bracket #2:
        ...

    Execute menu

      What would you like to do next?
        >options: list_results, follow_team, list_brackets, list_pre_rank, or exit

    IF input == pre_rank, show a list of teams & brackets

    Execute list_pre_rank

<> DEFINING OBJECTS --

    What is pre_rank?
      Original Rank comes from: https://www.ncaa.com/rankings/lacrosse-women/d3/iwlca-coaches
      Consists of top 25 teams only
      Not all teams have a pre_rank
      Not all ranked teams go to playoffs

    What is a game?
      A game has an :id
      A game has a :title
      A game has (2) teams - :winner & :loser
      A game has a :score
      A game has a :round - can be determined from :id
      A game has a :bracket

    What is a bracket?
      A bracket has a name - there are 4 brackets
      A bracket has rounds
      A bracket has games
      A bracket has a list of teams
      A bracket has a winner

    What is a round?
      A round has a name
      A round has a game or games
      A round has a winner or winners
      Belongs to brackets

    What is a team?
      A team has a name
      A team can have an original rank (if top 25 teams)
      A team has an end rank
      A team has a history of games (including scores, rounds and opponents)

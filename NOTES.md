How to Build a CLI Gemfile --

  1. Plan your gem, imagine your interface
  2. Start with the project structure - google
  3. Start with the entry point - the file run
  4. Force that to build the CLI interface
  5. stub out the interface
  6. Start making things real
  7. discover objects
  8. program


A command line interface for the lacrosse bracket --

  user types lax-bracket

  Show a list of teams & brackets
    Bracket #1:
    1. Trinity
    2. Amherst
    3. etc.

  Which team do you want to learn more about?

  1

  Shows more info on team 1
   "<team 1> came in <rank> place overall.
   They played <team> during <round> and <won/lost>. The final score was <score>.
   Then they played <team> during <round> and <won/lost>. The final score was <score>.
   Then they played..."

  To see a final rank of the teams type "rankings"

   Shows a list of the final rankings:
     1. Midddlebury
     2. TCNJ
     3. etc.

What is a bracket? --
 A bracket has a name
 A bracket has a list of teams
 A bracket has a winner
 A bracket has rounds

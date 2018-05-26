
#Our CLI Controller

class LaxBracket::CLI

  def call
    puts "Lacrosse Bracket includes:"
    list_brackets
  end

  def list_brackets
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts <<-DOC
      Bracket #1:
        1. Trinity
        2. Amherst
        3. etc.
      Bracket #2:
        1. MIddlebury
        2. Salisbury
        3. etc.
    DOC
  end

end

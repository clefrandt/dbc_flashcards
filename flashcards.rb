##############################
# User Story
  # Student expects x amount of flashcards
  # Student trys first definition
    # a) student gets it right and doesn't see it again
    # b) student gets flashcard wrong, and sees correct definition
  # Student is offered choices and show score--choices incldue:
    # a) Reset
    # b) Study missed material
    # c) Quit

##############################
# Pseudocode Enumeration:
  # Card Parser(C): read definitions and answers into a hash {ans => def, ans2 => def2}
    # Parse(M): convert txt file to hash
  # Deck(C): flashcard(A), score(A)
    # Storing/holding flashcards(M)
    # Remove flashcard(M)
    # Shuffle(M)
    # Return score(M)
  # Flashcards(C): definition(A), answer(A)
    # Make a new flashcard(M): creates an object that contains a definition and answer
            #  reading from the parsed data structure
    # Display the definition(M): prompt you to guess the answer to a definition 
    # Compare guess and answer(M): compare user input to answer, returns true or false 
    # Display the answer(M): show the answer
  # User Options(C): View Code 
    # render
    # Display three options(M):
      # a) Reset(M): Reset the deck of flashcards and start the program over
      # b) Study missed material(M): Start the program over with only the missed cards
      # c) Quit(M): Break and get out of the program
  # Game(C): Controller Code 
    # render(ask for file name)
    # Start the game(M): read the text file and parse the text file into an array of game
      # read# game.run!

##############################

# require 'csv'

class Flashcard_Parser
  
  def self.parse(file)
    place_holder = []
    File.open(file,'r').each_line do |line|
      if line != "\n"
        place_holder << line
      end
    end

    parsed_text = Hash[*place_holder]
    return parsed_text
  end
end


class Study

  def start!
    flash_hash = Flashcard_Parser.parse('flashcard_samples.txt')
    deck = Deck.new(flash_hash)
    UserInterface.welcome
    
  end

end

class UserInterface
  def welcome
    puts "get ready to learn!"
  end
end


current_study_sesh = Study.new
current_study_sesh.start!

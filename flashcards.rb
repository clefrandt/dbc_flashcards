class FlashCard
  attr_reader :definition, :answer, :in_the_deck

  def initialize(definition = "", answer = "")
    @answer = answer
    @definition = definition
    @in_the_deck = false
  end
  
  def compare_guess_answer(guess) # check if guess is a string
    guess = guess.downcase
    if guess == :answer
      in_the_deck = true   
     
       "#{guess} was right, Nice Job!"
        else 
        puts "#{guess} was wrong"
      end 
  end 
end 


class Deck
  attr_reader :card_objects

  def initialize(hash_1)
    @card_objects = make_deck(hash_1)
    # @hash = hash
  end  

  def make_deck(hash_1)
     hash_1.map{ |definition, answer| FlashCard.new(definition,answer) } 
  end

  def remove_correct_answers
    @card_objects.delete_if { |card|  card.in_the_deck }
  end 

  def shuffle_cards
    @card_objects.shuffle
  end

  def return_score
    100 - @card_objects.length  # 100 = hash length
  end

end

mycards = {"Definition1" => "Answer1", "Definition2"=>"Answer2" }

deck = Deck.new(mycards)
# p deck.card_objects 
# deck.remove_correct_answers
# puts "Here is the test"
# p deck.card_objects 
 p deck.make_deck(mycards).length

##### Driver Code
# mycard.answer == "Answer1" 
# mycard.definition == "Definition1"
# mycard.guess("Answer1") == true
# mycard.guess("Bad Answer") == false


# mydeck.cards = ????


# a = Flash.new("greeting", "hello") 

# a.compare_guess_answer("gu") == "gu was wrong"
# a.compare_guess_answer("hello") == "hello was right, Nice Job!"
# a.compare_guess_answer("Hello") == "hello was right, Nice Job!"



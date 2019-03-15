require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/round'
require 'pry'

# Inside of this file, write the code to do the following:
#
# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start (round.start)



  @card_1 = Card.new("What is 5 + 5?", "10", :STEM)

  @card_2 = Card.new("What is Rachel's favorite animal?", "Elephant", :Turing_Staff)

  @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)

  @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

  @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])
  @round = Round.new(@deck)

@round.start

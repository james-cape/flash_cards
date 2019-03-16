require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'


# @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
#
# @card_2 = Card.new("What is Rachel's favorite animal?", "Elephant", :Turing_Staff)
#
# @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
#
# @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
#


filename = "cards.txt"

cards = CardGenerator.new(filename).cards

@deck = Deck.new(cards)

@round = Round.new(@deck)

@round.start

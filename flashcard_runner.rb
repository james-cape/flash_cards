require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

filename = "cards.txt"
cards    = CardGenerator.new(filename).cards
deck     = Deck.new(cards)
round    = Round.new(deck)

round.start

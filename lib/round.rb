require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'

class Round

  attr_reader :deck,
              :turns
              :current_card

  def initialize(deck)
    @deck =         deck
    @turns =        []
    @current_card = []
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

# Creates an index based on how many turns have been taken.
  def deck_index
    @turns.count
  end

# Returns a card from the deck depending on the turn count.
  def current_card
    @deck.cards[deck_index]
  end

  def number_correct
    correct_turns_arr = []
    @turns.each do |turn|
      correct_turns_arr << turn if turn.correct?
    end
    correct_turns_arr.count
  end


  def number_correct_by_category(category)
# First create an array of turns with correct guesses.
    correct_turns_arr = []
    @turns.each do |turn|
      correct_turns_arr << turn if turn.correct?
    end
# Create a second array of turns with the right category, but that are shoveled in from the array of correct guesses.
    correct_cats_and_turns = []
    correct_turns_arr.each do |turn|
      correct_cats_and_turns << turn if turn.card.category == category
    end
    correct_cats_and_turns.count
  end

  def percent_correct
    100 * number_correct.to_f / @turns.count
  end

  def percent_correct_by_category(category)
    total_in_category = []
    @turns.each do |turn|
      total_in_category << turn if turn.card.category == category
    end

    100 * number_correct_by_category(category).to_f / total_in_category.count
  end




end

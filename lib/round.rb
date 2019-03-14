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
    correct_turns_arr = []
    correct_ans_and_cat = []
    @turns.each do |turn|
      correct_turns_arr << turn if turn.correct?
    end
    # binding.pry
    correct_turns_arr.each do |turn|
      binding.pry
      correct_ans_and_cat << turn if @turns[4] == category
    end
    correct_ans_and_cat.count
    # correct_turns_arr.cards_by_category(:Geography)




  end





end

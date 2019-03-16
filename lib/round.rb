require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'

class Round
  attr_reader :deck,
              :turns,
              :current_card

  def initialize(deck)
    @deck =         deck
    @turns =        []
    @current_card = []
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "-------------------------------------------------"

    i = 0
    while i < @deck.count
      puts "This is card number #{i + 1} out of #{@deck.count}."
      puts "Question: #{@deck.cards[i].question}"

      guess = gets.chomp
      take_turn(guess)

      puts turns.last.feedback #Correct or incorrect
      i += 1
    end

    puts "****** Game over! ******"
    # round_test instructions specified percentages to one decimal
    # Implement singular "guess" if 1 correct.
    puts "You had #{number_correct} correct guesses out of #{i} for a total score of #{percent_correct}%."

    categories.each do |cat|
      puts "#{cat} - #{percent_correct_by_category(cat)}% correct"
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def current_card # Returns a card from the deck depending on the current turn count.
    @deck.cards[@turns.count]
  end

  def number_correct
    correct_turns_arr = []
    @turns.each do |turn|
      correct_turns_arr << turn if turn.correct?
    end
    correct_turns_arr.count
  end

  def categories # Creates array of all categories entered by the end of the game.
    category_array = []
    @turns.map do |turn|
      category_array << turn.card.category
    end
    category_array.uniq
  end

  def number_correct_by_category(category)
    correct_turns_arr = []
    @turns.each do |turn|
      correct_turns_arr << turn if turn.correct? && turn.card.category == category
    end
    correct_turns_arr.count
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

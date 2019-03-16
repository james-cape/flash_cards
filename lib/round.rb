require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'

class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck =         deck
    @turns =        []
    @current_card = []
  end

  def start
    puts "Welcome! You're playing with #{deck.count} card#{"s" if @deck.count != 1}."
    puts "-------------------------------------------------"

# Iterates through cards, asks user for guesses, and ends after the last card.
    i = 0
    while i < deck.count
      puts "This is card number #{i + 1} out of #{deck.count}."
      puts "Question: #{deck.cards[i].question}"

      guess = gets.chomp
      take_turn(guess)

      puts turns.last.feedback #"Correct" or "incorrect"
      i += 1
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guess#{"es" if number_correct != 1} out of #{i} for a total score of #{percent_correct}%."

# Iterates through dynamic list of categories and puts % correct for each category.
    categories.each do |cat|
      puts "#{cat} - #{percent_correct_by_category(cat)}% correct"
    end
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    new_turn
  end

  def current_card # Returns a card from the deck depending on the current turn count.
    deck.cards[turns.count]
  end

  def number_correct
    turns.count { |turn| turn.correct? }
  end

  def categories
    turns.map { |turn| turn.card.category }.uniq
  end

  def number_correct_by_category(category)
    turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    100 * number_correct.to_f / turns.count
  end

  def percent_correct_by_category(category)
    total_in_category = turns.count { |turn| turn.card.category == category}
    100 * number_correct_by_category(category).to_f / total_in_category
  end

end

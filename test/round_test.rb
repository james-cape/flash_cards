require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require 'pry'

class RoundTest < Minitest::Test

#Can add attr_reader :card_1, :card_2, card_3, deck, round if you want to get rid of the "@" throughout the rest of the tests.

  def setup

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_instance_of_deck_and_round
    assert_instance_of Deck, @deck
    assert_instance_of Round, @round
    assert_instance_of Deck, @round.deck
  end

  def test_no_guess_submitted_yet
    assert_equal [], @round.turns
  end

  def test_card_1_is_in_play
    assert_equal @card_1, @round.current_card
  end

  def test_take_first_turn
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_correct
    new_turn = @round.take_turn("Juneau")
    assert new_turn.correct?
  end

  def test_round_turns
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
  end

  def test_number_correct_and_current_card
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    assert_equal @card_2, @round.current_card
  end

  def test_second_turn
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_instance_of Turn, @round.take_turn("Venus")
  end

  def test_number_of_turns_taken_after_two
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_feedback_on_second_guess
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_after_second_guess
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_none_right
    @round.take_turn("Juneau")
    @round.take_turn("Mars")

    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

# Can you take out all the "new_turn"s?
#
######

    expected = 50.0
    actual = @round.percent_correct

    assert_equal expected, actual
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expected = 100.0
    actual = @round.percent_correct_by_category(:Geography)

    assert_equal expected, actual
  end

  def test_current_card_after_two_turns

    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expected = @card_3
    actual = @round.current_card

    assert_equal expected, actual
  end

  def test_category_array_at_end_of_game

    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("Venus")

    expected = [:Geography, :STEM]
    actual = @round.categories

    assert_equal expected, actual

  end

end

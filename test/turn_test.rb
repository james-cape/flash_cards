require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  attr_reader :card,
              :turn
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end

  def test_turn_exists
    expected = Turn
    actual   = turn
    assert_instance_of expected, actual
  end

  def test_turn_has_a_guess
    expected = "Juneau"
    actual   = turn.guess
    assert_equal expected, actual
  end

  def test_card_exists_and_has_attributes
    assert_instance_of Card, card
    assert_equal   "Juneau", card.answer
    assert_equal :Geography, card.category
    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_if_if_the_guess_is_correct
    assert turn.correct?
  end

  def test_feedback_is_correct
    expected = "Correct!"
    actual   = turn.feedback
    assert_equal expected, actual
  end

  def test_incorrect_guesses_are_handled_properly
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute_equal     "Saturn", turn.card
    assert_equal     "Saturn", turn.guess
    assert_equal "Incorrect.", turn.feedback
    refute turn.correct?
  end

end

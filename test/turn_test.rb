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

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess

    assert_equal "Juneau", turn.guess
  end

  def test_card_exists_and_has_attributes

    assert_instance_of Card, card
    assert_equal card, turn.card
    assert_equal "Juneau", card.answer
    assert_equal :Geography, card.category
    assert_equal "What is the capital of Alaska?", card.question

  end

  def test_if_if_the_guess_is_correct

    assert turn.correct?

  end

  def test_feedback_is_correct

    assert_equal "Correct!", turn.feedback

  end

  def test_incorrect_guesses_are_handled_properly
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute_equal "Saturn", turn.card

    assert_equal "Saturn", turn.guess

    refute turn.correct?

    assert_equal "Incorrect.", turn.feedback

  end


end

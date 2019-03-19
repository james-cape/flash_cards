require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'
require 'pry'

class RoundTest < Minitest::Test
  attr_reader :card_1, :deck,
              :card_2, :round,
              :card_3
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck  = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_instance_of_deck_and_round
    ##### redundant after testing in .deck
    # assert_instance_of  Deck, deck
    assert_instance_of Round, round
    assert_instance_of  Deck, round.deck
  end

  def test_no_guess_submitted_yet
    expected = []
    actual   = round.turns
    assert_equal expected, actual
  end

  def test_card_1_is_in_play_at_start
    expected = card_1
    actual   = round.current_card
    assert_equal expected, actual
  end

  def test_turn_is_created
    new_turn = round.take_turn("Juneau")

    expected = Turn
    actual   = new_turn
    assert_instance_of expected, actual
  end

  def test_first_guess_is_correct
    new_turn = round.take_turn("Juneau")

    assert new_turn.correct?
  end

  def test_first_guess_is_incorrect
    new_turn = round.take_turn("nobody knows")

    refute new_turn.correct?
  end

  def test_first_and_second_rounds_are_stored
    round.take_turn("Juneau")
    round.take_turn("mars")

    assert_equal   "Juneau", round.turns[0].card.answer
    assert_equal   "Juneau", round.turns[0].guess
    assert_equal :Geography, round.turns[0].card.category

    assert_equal     "Mars", round.turns[1].card.answer
    assert_equal     "Mars", round.turns[1].guess
    assert_equal      :Stem, round.turns[1].card.category
  end

  def test_guesses_correct_and_current_card
    round.take_turn("Juneau")

    assert_equal      1, round.number_correct
    assert_equal card_2, round.current_card
  end

  def test_second_turn_is_created
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = Turn
    actual   = round.take_turn("Venus")
    assert_instance_of expected, actual
  end

  def test_two_turns_taken_and_stored
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = 2
    actual   = round.turns.count
    assert_equal expected, actual
  end

  def test_feedback_on_last_guess
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = "Incorrect."
    actual   = round.turns.last.feedback
    assert_equal expected, actual
  end

  def test_number_correct_after_last_guess
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = 1
    actual   = round.number_correct
    assert_equal expected, actual
  end

  def test_number_correct_by_category
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = 1
    actual   = round.number_correct_by_category(:Geography)
    assert_equal expected, actual
  end

  def test_number_correct_by_category_none_right
    round.take_turn("Juneau")
    round.take_turn("Hershey")

    expected = 0
    actual   = round.number_correct_by_category(:Stem)
    assert_equal expected, actual
  end

  def test_percent_correct_overall
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = 50.0
    actual   = round.percent_correct
    assert_equal expected, actual
  end

  def test_percent_correct_by_category
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = 100.0
    actual   = round.percent_correct_by_category(:Geography)
    assert_equal expected, actual
  end

  def test_current_card_after_two_turns
    round.take_turn("Juneau")
    round.take_turn("Venus")

    expected = card_3
    actual   = round.current_card
    assert_equal expected, actual
  end

  def test_creates_list_of_all_categories
    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.take_turn("Venus")

    expected = [:Geography, :Stem]
    actual   = round.categories
    assert_equal expected, actual
  end

end

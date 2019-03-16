require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  attr_reader :card_1, :cards,
              :card_2, :deck,
              :card_3
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards  = [card_1, card_2, card_3]
    @deck   = Deck.new(cards)
  end

  def test_three_cards_exist
    assert_instance_of Card, card_1
    assert_instance_of Card, card_2
    assert_instance_of Card, card_3
    assert_instance_of Deck, deck
  end

  def test_counting_cards_in_deck
    expected = 3
    actual   = deck.count
    assert_equal expected, actual
  end

  def test_each_card_was_added_to_deck
    expected = [card_1, card_2, card_3]
    actual   = deck.cards
    assert_equal expected, actual
  end

  def test_counting_cards_by_category
    expected = 2
    actual   = deck.count_cards_in_category(:STEM)
    assert_equal expected, actual
  end

  def test_finding_and_returning_cards_by_category
    expected = [card_2, card_3]
    actual   = deck.cards_in_category(:STEM)
    assert_equal expected, actual
  end

end

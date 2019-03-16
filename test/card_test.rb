require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  attr_reader :card
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_card_exists
    expected = Card
    actual   = card
    assert_instance_of expected, actual
  end

  def test_card_has_a_question
    expected = "What is the capital of Alaska?"
    actual   = card.question
    assert_equal expected, actual
  end

  def test_card_has_an_answer
    expected = "Juneau"
    actual   = card.answer
    assert_equal expected, actual
  end

  def test_card_has_a_category
    expected = :Geography
    actual   = card.category
    assert_equal expected, actual
  end
end

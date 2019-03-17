require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test
  attr_reader :filename,
              :cards_origin
  def setup
    @filename     = "cards.txt"
    @cards_origin = CardGenerator.new(filename)
  end

  def test_card_generator_exists
    expected  = CardGenerator
    actual    = cards_origin
    assert_instance_of expected, actual
  end

  def test_read_file
    expected = "What is 5 + 5?,10,STEM
What is Rachel's favorite animal?,red panda,Turing Staff
What is Mike's middle name?,nobody knows,Turing Staff
What cardboard cutout lives at Turing?,Justin bieber,PopCulture
"

    actual = cards_origin.read_file
    assert_equal expected, actual
  end

  def test_produce_array_of_rows
    expected = ["What is 5 + 5?,10,STEM", "What is Rachel's favorite animal?,red panda,Turing Staff", "What is Mike's middle name?,nobody knows,Turing Staff", "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"]

    actual = cards_origin.rows_array
    assert_equal expected, actual
  end

  def test_break_rows_into_elements
    expected = [["What is 5 + 5?", "10", "STEM"], ["What is Rachel's favorite animal?", "red panda", "Turing Staff"], ["What is Mike's middle name?", "nobody knows", "Turing Staff"], ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]]

    actual = cards_origin.break_rows
    assert_equal expected, actual
  end

  def test_element_num_to_string_and_category_to_symbol
    assert_equal   "Redpanda", cards_origin.cards[1].answer
    assert_equal :Popculture, cards_origin.cards[3].category
  end

end

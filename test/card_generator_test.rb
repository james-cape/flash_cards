require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'


class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists

    filename = "cards.txt"
    cards_origin = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards_origin
  end

  def test_read_file

    filename = "cards.txt"
    cards_origin = CardGenerator.new(filename)

    assert_equal "What is 5 + 5?,10,STEM
What is Rachel's favorite animal?,red panda,Turing Staff
What is Mike's middle name?,nobody knows,Turing Staff
What cardboard cutout lives at Turing?,Justin bieber,PopCulture
", cards_origin.read_file

  end


  def test_produce_array_of_rows
    filename = "cards.txt"
    cards_origin = CardGenerator.new(filename)

    assert_equal ["What is 5 + 5?,10,STEM", "What is Rachel's favorite animal?,red panda,Turing Staff", "What is Mike's middle name?,nobody knows,Turing Staff", "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"], cards_origin.rows_array
  end

  def test_break_rows_into_elements
    filename = "cards.txt"
    cards_origin = CardGenerator.new(filename)

    assert_equal [["What is 5 + 5?", "10", "STEM"], ["What is Rachel's favorite animal?", "red panda", "Turing Staff"], ["What is Mike's middle name?", "nobody knows", "Turing Staff"], ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]], cards_origin.break_rows
  end


  def test_element_num_to_string_and_category_to_symbol

    filename = "cards.txt"
    cards_origin = CardGenerator.new(filename)

    assert_equal "red panda", cards_origin.cards[1].answer

    assert_equal ":PopCulture", cards_origin.cards[3].category

  end

end

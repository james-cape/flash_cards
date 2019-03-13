require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    round = Round.new

    assert_instance_of Round, round
  end

end

class Deck

# A deck is initilized.
  attr_reader :cards
  def initialize
    @cards = Array.new

  end

# This method adds cards to the deck.
  def << (new_card)
    @cards << new_card
  end

end

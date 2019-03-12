class Deck

# A deck is initilized.
  attr_accessor :deck
  def initialize
    @deck = Array.new

  end

# This method adds cards to the deck.
  def add_to_deck(new_card)
    @deck << new_card
  end

end

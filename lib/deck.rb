require './lib/card'

class Deck

# A deck is initilized.
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

# This method counts the cards currently in the deck.
  def count
    cards.count
  end

# This method counts and returns which cards fall under a category. Uses lib/card because card_1 is not an array by itself, it is just an object with attributes.
  def cards_in_category(category)
    cards.count { |i| i.category == category}
  end

end

require './lib/card'

class Deck

# A deck is initilized.
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    # @cards = Array.new

  end

# This method adds cards to the deck.
  # def << (new_card)
  #   @cards << new_card
  # end

# This method counts the cards currently in the dec k.
  def count
    cards.count
  end

# This method counts and returns which cards fall under a category. Uses lib/card because card_1 is not an array by itself, it is just an object with attributes.
  def cards_in_category(category)

    cards.count { |i| i.category == category}

  end

end

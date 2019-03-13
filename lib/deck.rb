require './lib/card'

class Deck

# A deck is initilized.
  attr_reader           :cards
                        :cards_by_category
  def initialize(cards)
    @cards              = cards
    @cards_by_category  = []
  end

# This method counts the cards currently in the deck.
  def count
    cards.count
  end

# This method counts which cards fall under a category. Uses lib/card because card_1 is not an array by itself, it is just an object with attributes.
  def count_cards_in_category(category)
    cards.count { |i| i.category == category}
  end

# This method returns which cards fall under a category. Uses lib/card because card_1 is not an array by itself, it is just an object with attributes.
  def list_cards_in_category(category)
    cards.each do |card|
      @cards_by_category << card if card.category == category
    end
    @cards_by_category
  end

end

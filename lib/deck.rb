require './lib/card'

class Deck
  attr_reader           :cards,
                        :cards_by_category
  def initialize(cards)
    @cards              = cards
    @cards_by_category  = []
  end

  def count
   cards.count
  end

  def count_cards_in_category(category)
    cards.count do |card|
      card.category == category
    end
  end

  def cards_in_category(category)
    cards.find_all do |card|
      card.category == category
    end
  end

end

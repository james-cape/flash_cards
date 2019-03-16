class Turn
  attr_reader :guess,
              :card
  def initialize (guess, card)
    @guess = guess
    @card  = card
  end

# How to handle "ten" instead of 10?
# How to handle spaces on either side of the answer?
  def correct?
    card.answer.downcase == guess.downcase
  end

  def feedback
    return "Correct!" if card.answer.downcase == guess.downcase
    "Incorrect."
  end

end

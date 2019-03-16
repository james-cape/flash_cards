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
    @card.answer == @guess
  end

  def feedback
    return "Correct!" if @card.answer == @guess
    "Incorrect."
  end

end

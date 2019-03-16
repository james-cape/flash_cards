class Turn

# A turn is initialized with two arguments. The first is a string representing a guess to a card’s question. The second argument is a Card object representing the current flashcard being shown.
  attr_reader :guess,
              :card
  def initialize (guess, card)
    @guess = guess
    @card  = card
  end

# This method returns a boolean indicating if the guess matched the answer on the Card.
# How to handle "ten" instead of 10?
# How to handle spaces on either side of the answer?

  def correct?
    @card.answer == @guess
  end

# This method either returns "Correct!" or "Incorrect." based on whether the guess was correct or not.
  def feedback
    return "Correct!" if @card.answer == @guess
    "Incorrect."
  end
end

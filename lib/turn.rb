class Turn
  attr_reader :guess,
              :card
  def initialize (guess, card)

    # Normalizes answers for errant spaces and capitalizations.
    @guess = guess.to_s.strip.downcase.capitalize.delete(' ')
    @card  = card
  end

  def correct?
    card.answer == guess
  end

  def feedback
    return "Correct!" if card.answer == guess
    "Incorrect."
  end

end

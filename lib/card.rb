class Card

  attr_reader :question,
              :answer,
              :category

  def initialize(question, answer, category)
    @question = question

# Normalizes answers for errant spaces and capitalizations.
    @answer   = answer.to_s.strip.downcase.capitalize.delete(' ')
    @category = category.to_s.strip.downcase.delete(' ').capitalize.to_sym
  end

end

# Adding comment to change file and create pull.

# Add a second comment

# Add a third comment

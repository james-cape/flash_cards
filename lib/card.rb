class Card

  attr_reader :question,
              :answer,
              :category

  def initialize(question, answer, category)
    @question = question

##### Consider putting "method - clean" in.

# Normalizes answers for errant spaces and capitalizations.
    @answer   = answer.to_s.strip.downcase.capitalize.delete(' ')
    @category = category.to_s.strip.downcase.delete(' ').capitalize.to_sym
  end

end

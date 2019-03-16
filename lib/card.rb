class Card

  attr_reader :question,
              :answer,
              :category

  def initialize(question, answer, category)
    @question = question


    @answer   = answer.to_s.strip.downcase.capitalize.delete(' ')
    @category = category.to_s.strip.downcase.delete(' ').capitalize.to_sym
  end

end

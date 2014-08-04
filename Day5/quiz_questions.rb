class Question

  attr_reader :question, :choices, :answer

  def initialize question: nil, choices: nil, answer: nil
    @question, @choices, @answer = question, choices, answer
  end

end

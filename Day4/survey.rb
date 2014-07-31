# Will & Robert's attempt at survey questionaire
class Survey

  attr_reader :responses

  @@choices = [
    "1. Strongly Agree",
    "2. Agree",
    "3. Neutral",
    "4. Disagree",
    "5. Strongly Disagree"
    ]

  def initialize
    @questions = [
      "I'm feeling happy.",
      "I love coffee.",
      "Beer is my friend.",
      "Ruby, Ruby, Ruby!!!",
      "I would jump out of a plane."
    ]

    @responses = Array.new
  end

  def finished?
    @questions.empty?
  end

  def ask_question
    @questions.pop
  end

  def display_choices
    @@choices
  end

  def response(number)
    @responses.push(number.to_i)
  end

  def calc_average
    @responses.reduce(:+).to_f / @responses.length
  end

end

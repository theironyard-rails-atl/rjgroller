require 'highline/import'
require './quiz_questions.rb'

class Quiz
  attr_accessor :score
  attr_reader :questions

  def initialize(score=0)
     @score = score
     @questions =[
       Question.new(
         question: "What is the air speed velocity of an unladen sparrow?",
         choices: [
           "African?",
           "European?",
           "I don't know?",
           "30 km/hr"
         ],
         answer: 2
       ),
       Question.new(
         question: "Where is Atlanta?",
         choices: [
           "Africa",
           "New York",
           "Canada",
           "Georgia"
         ],
         answer: 3
       ),
       Question.new(
         question: "Who invented the internet?",
         choices: [
           "Al Gore",
           "DARPA",
           "Martians",
           "The Illuminati"
         ],
         answer: 1
       ),
       Question.new(
         question: "What is the best movie ever?",
         choices: [
           "Fight Club",
           "Snatch",
           "Inception",
           "Frozen"
         ],
         answer: 0
       ),
       Question.new(
         question: "Do you really want to hurt me?",
         choices: [
           "yes",
           "no",
           "maybe",
           "I don't know"
         ],
         answer: 1
       )
     ].shuffle!
  end

  def finished?
    @questions.empty?
  end

  def ask_question
    @ask = @questions.pop
    @ask.question
  end

  def show_choices
    # @ask[question.choices.each_with_index] { |choice, idx| puts "#{idx+1}. #{choice}" }
    @ask.choices.each_with_index do |choice, idx|
      puts "#{idx+1}. #{choice}"
    end
    puts "Please make a selection: "
  end

  def choose
    ask("Your selection (enter number):  ") do |choice|
      choice.in = %{ 1 2 3 4 }
    end
  end

  def calculate(input)
    if @ask.answer == input.to_i - 1
      @score += 1
    end
  end

  def run
    system "clear"
    puts
    puts "Time for a quiz!"
    puts

    until finished? do
      puts
      puts ask_question
      puts show_choices
      # choose
      calculate(choose)
    end

    puts "All finished! You scored #{score}"
    exit
  end

end


# Run Quiz

if $PROGRAM_NAME == __FILE__
  Quiz.new.run
end

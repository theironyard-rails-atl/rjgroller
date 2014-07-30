require './quiz_questions.rb'
# require 'pry'
# New Quiz
quiz = PopQuiz.new
puts
puts "Time for a pop quiz!"
puts

until quiz.finished? do
  puts quiz.ask_question
  quiz.show_choices
  # take chosen and subtract from 1 to get correct index
  chosen = gets.chomp[0].to_i - 1
  quiz.calculate(chosen)
end

puts "All finished! You scored #{quiz.score}"
# binding.pry
exit


# Update Score

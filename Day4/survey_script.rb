# Will & Robert's attempt at survey questionaire
require "./survey.rb"

survey = Survey.new
puts
puts "ATTENTION: You are now taking a survey"
puts "Please answer the following questions as honestly as you can."
puts
puts

until survey.finished?
  puts survey.ask_question
  puts

  survey.display_choices.each { |choice| puts choice }

  puts
  puts "How do you feel? <please enter a number>"
  input = gets.chomp[0].to_i
  survey.response(input)
end

puts
puts "Here are your results"
puts "Minimum score #{survey.responses.min}"
puts "Maximum score #{survey.responses.max}"
puts "Your average score is #{survey.calc_average}"
puts
puts "Thank you for participating!"

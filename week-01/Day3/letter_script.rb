require './letter_counter.rb'

puts "Please provide a string: "
test_string = gets.chomp

testrun = LetterCounter.new(test_string)
testrun.letters_to_hash
testrun.letter_count_to_hash
testrun.print_letter_counts

puts "Count for a specific letter? (y/n)"
answer = gets.chomp[0].downcase
if answer == "y"
  puts "Enter letter: "
  letter = gets.chomp[0].downcase
  testrun.print_specific(letter)
else
  exit
end

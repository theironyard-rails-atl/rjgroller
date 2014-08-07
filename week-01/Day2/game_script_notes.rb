require "./guessing_game_notes.rb"

puts "Starting the Guessing Game"
game = GuessingGame.new

until game.finished?
  number = gets.to_i
  guess.guess(number)
end

if game.won?
  puts "You Won!"
else
  puts "You lost..."
end

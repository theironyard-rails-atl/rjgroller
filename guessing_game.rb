def guessing_game
  guesses = 7
  max_num = 100
  secret_num = Random.rand(max_num)

  puts "You have #{guesses} remaining guesses"
  puts "Please guess a number between 1 and #{max_num}: "
  guess = gets.to_i

  while true
    if guess.eql?(secret_num)
      puts "You win!!!"
      break
    elsif guesses.zero?
      puts "You lose. The number was #{secret_num}"
      break
    else
      if secret_num > guess
        puts "Too Low"
      else
        puts "Too High"
      end
      puts
      guesses -= 1
      puts "You have #{guesses} remaining guesses"
      puts
      puts "Please guess a number between 1 and #{max_num}:"
      guess = gets.to_i
    end
  end
end



# 7
# if == sn -> win
# if == 0 -> lose

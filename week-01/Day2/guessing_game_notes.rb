class GuessingGame
  # Make a guess
  # - determine if won or lost
  # - respond with high/low
  # Keep track of guesses
  # - fail if run out

  def initialize
    @answer = (0..100).to_a.sample
    @trys_left = 5
    @won = false
  end

  def guess(number)
    # count guesses - instance specific
    @tries_left -= 1

    # win if correct
    if number == @answer
      @won = true
    # describe high low if not
    elseif number < @answer
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
  end

  def finished?
    # Guessed the number
    # Out of tries or guessed numbers
    # if @tries_left.zero?
    #   true
    # elsif @won # guessed number
    #   true
    # else
    #   false
    # end
    @tries_left.zero? || @won
  end
end

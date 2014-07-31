class Hangman

attr_reader :misses_remaining

  def initialize(answer)
    @answer = answer
    @misses_remaining = 6
    @guessed = Array.new
  end

  def board
    # Take answer and only show letters player has guessed
    result = ""
    @answer.split("").each do |char|
      if @guessed.include?(char)
        result += char
      else
        result += "_"
      end
    end
    result
  end

  def guess(letter)
    #TODO - Clean up
    # Return if true if correct guess
    letter.downcase!
    if @answer.include?(letter)
      @guessed.push(letter)
      true
    else
      unless @guessed.include?(letter)
        @guessed.push(letter)
        @misses_remaining -= 1
      end
      false
    end
  end

  def available_letters
    ('a'..'z').to_a - @guessed
  end

  def finished?
    won? || lost?
  end

  def won?
    !board.include?("_")
  end

  def lost?
    @misses_remaining.zero?
  end

end

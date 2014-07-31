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
    @guessed.push(letter)
    # Return if true if correct guess
    if @answer.include?(letter)
      true
    else
      false
    end
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

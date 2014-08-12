class Shift
  def initialize(word)
    @word = word.to_s.chomp
    @letters = @word.chars
  end

  def right
    new_word = @letters.unshift(@letters.pop).join
    new_word
  end
  
  def left
    new_word = @letters.push(@letters.shift).join
  end
end

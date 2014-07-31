class LetterCounter

  def initialize(words)
    @letters = words.downcase.chars
    @count_of_letters = Hash.new
  end

  # def letters_to_hash
  #   @letters.each { |letter| @count_of_letters[letter] = 0 }
  # end

  def letters_to_hash
    @letters.each do |letter|
      if letter =~ /[[:alpha:]]/
        @count_of_letters[letter] = 0
      end
    end
  end

  def letter_count_to_hash
    @count_of_letters.each { |key, value| @count_of_letters[key] = @letters.count(key) }
  end

  def print_letter_counts
    @count_of_letters.each { |key, value| puts "#{key}: #{value}"}
  end

  def print_specific(input)
    if @count_of_letters.has_key?(input)
      puts "#{input}: #{@count_of_letters[input]}"
    else
      "That letter does not occur"
    end
  end

end

require "pry"

class Card
  SUITS = %i{C S H D}
  RANKS = (2..10).to_a + %i{J Q K A}
end

# OlderKeywordCard.new(:rank => rank, :suit => suit) this constuct is used so much brackets aren't needed
# note that you MUST pass in a hash as it is expecting 1 argument
class OlderKeywordCard #old ruby
  def initialize hash={}
    @rank = hash[:rank] || Card::RANKS.sample
    @suit = hash[:suit] || Card::SUITS.sample
  end
end


class NewerKeywordCard #new ruby
  def initialize rank: nil, suit: nil
    @rank = rank || Card::RANKS.sample
    @suit = suit || Card::SUITS.sample
    binding.pry
  end
end

# splat operator example
def sum(*nums)
  nums.reduce(&:+) # numbers.reduce { |sum, number| sum + number }
end

# & means to_proc. optional in this case
# inject and reduce are synonyms

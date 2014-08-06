class Card
  RANKS = (2..10).to_a + %i{J Q K A}
  SUITS = %i{C D H S}

  include Comparable

  attr_reader :rank

  def initialize(rank)
    @rank = rank
  end

  def <=>(other)
    self.rank <=> other.rank
  end
  
  def value
    case rank
    when :K
      13
    when :Q
      12
    when :J
      11
    when :A
      1
    end
  end
end

class Deck
  include Enumerable

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUIT.each do |suit|
        @card.push Card.new(rank, suit)
      end
    end
  end

  def each
    @cards.each { |card| yield card }
  end
end

class Card
  SUITS = %i{C S H D}
  RANKS = (2..10).to_a + %i{J Q K A}
  attr_reader :suit, :rank

  def initialize(rank: nil, suit: nil)
    if SUITS.include?(suit) && RANKS.include?(rank)
      @suit, @rank = suit, rank
    end
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end


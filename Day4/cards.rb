$suits = %i{C S H D}
$ranks = [:A] + (2..10).to_a + %i{J Q K}

class Card
  # suit, rank
  attr_reader :suit
  attr_reader :rank

  def initialize(suit, rank)
    if $suits.include?(suit) && $ranks.include?(rank)
      @suit = suit
      @rank = rank
    end
  end

  def to_s
    "The #{@rank} of #{@suit}s"
  end
end

class Deck

  attr_reader :deck

  def initialize
    @deck = Array.new
    $ranks.each do |rank|
      $suits.each do |suit|
        @deck << Card.new(suit, rank)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end
end

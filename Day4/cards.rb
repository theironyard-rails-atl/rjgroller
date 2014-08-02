$suits = %i{C S H D}
$ranks = [:A] + (2..10).to_a + %i{J Q K}

class Card
  # suit, rank
  attr_reader :suit
  attr_reader :rank

  def initialize(rank, suit)
    if $suits.include?(suit) && $ranks.include?(rank)
      @suit = suit
      @rank = rank
    end
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end

class Deck

  attr_reader :cards

  def initialize
    @cards = Array.new
    $ranks.each do |rank|
      $suits.each do |suit|
        @cards << Card.new(rank,suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end

  def to_s
    @cards.join(", ")
  end

end

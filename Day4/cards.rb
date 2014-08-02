$suits = %i{C S H D}
$ranks = (2..10).to_a + %i{J Q K A}

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
  attr_reader :drawn_cards

  def initialize
    @cards = Array.new
    @drawn_cards = Array.new
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
    card = @cards.pop
    @drawn_cards << card
    card
  end

  def to_s
    @cards.join(", ")
  end

end

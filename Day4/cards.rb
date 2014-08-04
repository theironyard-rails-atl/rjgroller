$suits = %i{C S H D}
$ranks = (2..10).to_a + %i{J Q K A}
#should implement at a constant in the card class

class Card
  # suit, rank
  attr_reader :suit, :rank

  def initialize(rank, suit)
    if $suits.include?(suit) && $ranks.include?(rank)
      @suit, @rank = suit, rank
    end
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end

class Deck

  attr_reader :cards
  attr_reader :drawn_cards

  def initialize(num_of_decks=1)
    @cards, @drawn_cards = [], []
    num_of_decks.times do
      $ranks.each do |rank|
        $suits.each do |suit|
          @cards << Card.new(rank,suit)
        end
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

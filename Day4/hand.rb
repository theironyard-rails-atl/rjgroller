require "./cards.rb"

class Hand

  @@bj_values = (2..9).to_a + Array.new(4, 10) + [11]
  @@card_values = $ranks.zip(@@bj_values).to_h

  attr_accessor :hand

  def initialize
    @hand = Array.new
    @aces = 0
  end

  def add_card(*cards)
    cards.each { |card| @hand << card }
  end

  def get_value
    @value = 0
    @hand.each do |card|
      @value += @@card_values[card.rank]
      if card.rank == :A
        @aces += 1
      end
    end

    until @aces == 0
      if @value > 21
        @value -= 10
      end
      @aces -= 1
    end
    @value
  end

  def to_s
    @hand.join(", ")
  end

  def blackjack?
    get_value == 21
  end

  def busted?
    get_value > 21
  end

  def stand?
    # Modify to be stand for both player and dealer
    get_value >= 17
  end

end

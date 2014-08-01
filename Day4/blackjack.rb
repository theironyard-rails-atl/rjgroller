require "./cards.rb"
#move to script?
# score, outcome, in_play, deck, player, dealer
# Deal, Hit, Stand, Surrender

class Hand
  # add_card, get_value, draw
  attr_accessor :hand

  def initialize
    @bj_values = (2..9).to_a + Array.new(4, 10)
    @card_values = $ranks.zip(@bj.values)
    @hand = Array.new
    @value = 0
    @has_ace = False
  end

  def get_value

    @hand.each do |card|
      @value += $value[card.rank]
      if card.rank == 'A'
        @has_ace = true
      end
    end
    # Calculate value of hand if there is an ace
    if has_ace
      if @value + 10 <= 21
        @value += 10
      end
    end
    @value
  end

end

# def deal
#   # Deals all appropriate cards to players at the start of every hand
# end
#
# def hit
# end
#
# def split
# end
#
# def double
# end
#
# def stand
# end
#
# def surrender
# end

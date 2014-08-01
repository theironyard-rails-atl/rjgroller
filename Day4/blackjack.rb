require "./cards.rb"
# score, outcome, in_play, deck, player, dealer

class Hand
  # add_card, get_value, draw

  @@bj_values = (1..9).to_a + Array.new(4, 10)
  @@card_values = $ranks.zip(@@bj_values).to_h

  attr_accessor :hand

  def initialize
    @hand = Array.new
    @value = 0
    @has_ace = false
  end

  def add_card(card)
    @hand << card
  end

  def get_value
    @value = 0
    @hand.each do |card|
      @value += @@card_values[card.rank]
      if card.rank == :A
        @has_ace = true
      end
    end
    # Calculate value of hand if there is an ace
    if @has_ace
      if @value + 10 <= 21
        @value += 10
      end
    end
    @value
  end

end

def deal

  # Create hands
  player = Hand.new
  dealer = Hand.new

  # prepare a new deck
  deck = Deck.new
  deck.shuffle

  #test
  player.add_card(deck.deal_card)
  dealer.add_card(deck.deal_card)

  # Deal 2 cards each to a player and the dealer
  # 2.times do |x|
  #   player.add_card(deck.deal_card)
  #   dealer.add_card(deck.deal_card)
  # end

end
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

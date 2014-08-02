require "./cards.rb"
require "pry"
# score, outcome, in_play, deck, player, dealer

class Hand

  @@bj_values = (1..9).to_a + Array.new(4, 10)
  @@card_values = $ranks.zip(@@bj_values).to_h

  attr_accessor :hand

  def initialize
    @hand = Array.new
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
    # Calculate value of hand if there is an ace - need to handle multiple aces
    if @has_ace
      if @value + 10 <= 21
        @value += 10
      end
    end
    @value
  end

  def to_s
    @hand.join(", ")
  end

  def blackjack?
    @value == 21
  end

  def busted?
    @value > 21
  end

end

class BlackJack

  attr_reader :choice

  def initialize
    @deck = Deck.new
    @deck.shuffle
  end

  def display
    msg = "Dealer is showing #{@dealer.hand[1]}"
    puts msg

    msg = "You have #{@player.to_s}"
    puts msg
  end

  def prompt
    # Prompt user for action
    msg = "Woud you like to stand (1) or hit (2)?"
    puts msg
    @choice = gets.to_int
    @choice
  end

  def deal
    # Message to @player
    msg = "Dealing cards..."
    puts msg

    # Create hands
    @player = Hand.new
    @dealer = Hand.new

    # Deal 2 cards each to a player and the dealer
    2.times do |x|
      @player.add_card(deck.deal_card)
      @dealer.add_card(deck.deal_card)
    end

    # Display user input
    display
    prompt
  end

  def dlr_stands?
    @dealer.get_value >= 17
  end

  def hit
    @player.add_card(deck.deal_card)
    if @player.blackjack?
      msg = "You win!"
      puts msg
    elsif @player.busted?
      msg = "You lose."
      print msg
    else
      display
      prompt
    end
  end

  def stand
    until dlr_stands? or @dealer.busted?
      @player.get_value > @dealer.get_value

  end
  #
  # def split
  # end
  #
  # def double
  # end

  #
  # def surrender
  # end
  # def reshuffle?
  #   deck.count < 20
  # end
end

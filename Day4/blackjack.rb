require "./cards.rb"
require "./hand.rb"
require "pry"

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

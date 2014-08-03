%w{cards hand player}.each { |fname| require "./#{fname}.rb" }

# require "./cards.rb"
# require "./hand.rb"
# require "./player.rb"
require "pry"

class Blackjack

  attr_reader :choice
  attr_reader :player
  attr_reader :dealer

  def initialize
    @deck = Deck.new
    @deck.shuffle
    @player = Player.new(100)
  end

  def display_cards
    msg = "Dealer is showing #{@dealer.hand[1]}"
    puts msg

    msg = "You have #{@player.to_s}"
    puts msg
  end

  def display_wallet

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
    @player.bet

    msg = "Dealing cards..."
    puts msg

    # Create hands
    @player.hand = Hand.new
    @dealer = Hand.new

    # Deal 2 cards each to a player and the dealer
    2.times do |x|
      @player.add_card(deck.deal_card)
      @dealer.add_card(deck.deal_card)
    end

    # Display user input
    if dealer.blackjack?
      resolve_round
    else
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

  def continue?
    rxp = /[Yy|Nn]/
    msg = "Would you like to continue playing? (y/n)"
    puts msg
    choice = gets.chomp[0]
    until rxp === choice
      puts "Please enter a valid response."
      msg
      choice = gets.chomp[0]
    end
    choice == "y" ? true : false
  end

  # def resolve_round
  #   if player.get_value == dealer.get_value
  #     @resolution = :push
  #   elsif player.get_value > dealer.get_value
  #     @
  #   else
  #
  #   end
  # end

  def end_game
    msg = "Your final winnings are: #{@player.wallet}. Thanks for playing!"
    exit
  end

  def reshuffle?
    # check if deck is 25 - 50% used up
    if @deck.count < Random.rand(13) + 13
      @deck = Deck.new
      @deck.shuffle
    end
  end

  # def split
  # end
  #
  # def double
  # end

  #
  # def surrender
  # end

end

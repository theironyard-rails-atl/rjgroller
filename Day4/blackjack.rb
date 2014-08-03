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
    @invalid_msg = "Please enter a valid response."
  end

  def display_cards
    msg = "Dealer is showing #{@dealer.hand[1]}"
    puts msg

    msg = "You have #{@player.to_s}"
    puts msg
  end

  def display_wallet

  end

  def wallet_empty?
    @player.wallet == 0
  end

  def prompt
    # Prompt user for action
    rxp = /[sS|hH]/
    msg = "Woud you like to (S)tand or (H)it?"
    puts msg
    choice = gets.chomp[0]
    until rxp =~ choice
      puts @invalid_msg
      msg
      choice = gets.chomp[0]
    end
    choice
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
    if @dealer.blackjack? || @player.blackjack?

    else
      display
      prompt
  end

  def dlr_stands?
    @dealer.get_value >= 17
  end

  def hit(person)
    person.add_card(deck.deal_card)
    display
    prompt
  end

  def stand
      true
  end

  def blackjacks?
      @dealer.blackjack? || @player.hand.blackjack?
  end

  def continue?
    rxp = /[Yy|Nn]/
    msg = "Would you like to continue playing? (y/n)"
    puts msg
    choice = gets.chomp[0]
    until rxp === choice
      puts @invalid_msg
      msg
      choice = gets.chomp[0]
    end
    choice == "y" ? true : false
  end

  def resolve_round
    if @player.busted? || @player.get_value < @dealer.get_value
      @player.wallet -= @player.wager
      puts "You lost this round."
    elsif @dealer.busted? || @player.get_value > @dealer.get_value
      @player.wallet += @player.wager
      puts "You won this round."
    else
      puts "Push - no winner this round."
    end
    @player.show_wallet
  end

  def end_game
    msg = "Your final winnings are: #{@player.wallet}. Thanks for playing!"
    self.destroy!
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

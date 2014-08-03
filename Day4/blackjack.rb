%w{cards hand player}.each { |fname| require "./#{fname}.rb" }
require "pry"

class Blackjack

  attr_accessor :player
  attr_accessor :dealer
  attr_accessor :deck
  attr_accessor :continue
  attr_accessor :stand

  def initialize
    @deck = Deck.new
    @deck.shuffle
    @player = Player.new(100)
    @invalid_msg = "Please enter a valid response."
    @continue = true
    @stand = false
  end

  def display
    if @dealer.blackjack? || @player.hand.stand
      msg = "Dealer has #{@dealer.to_s}"
    else
      msg = "Dealer is showing #{@dealer.hand[1]}"
    end
    puts msg
    msg = "You have #{@player.hand.to_s}"
    puts msg
    puts
  end

  def wallet_empty?
    @player.wallet == 0
  end

  def hit?
    # Prompt user for action
    rxp = /[sS|hH]/
    msg = "Would you like to (S)tand or (H)it?"
    puts msg
    choice = gets.upcase.chomp[0]
    until rxp =~ choice
      puts @invalid_msg
      msg
      choice = gets.upcase.chomp[0]
    end
    choice == "H" ? true : false
  end

  def deal
    # Message to @player
    @player.bet

    msg = "Dealing cards..."
    puts msg
    puts

    # Create hands
    @player.hand = Hand.new
    @dealer = Hand.new

    # Deal 2 cards each to a player and the dealer
    2.times do |x|
      @player.hand.add_card(deck.deal_card)
      @dealer.add_card(deck.deal_card)
    end
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
    choice == "y" ? @continue = true : @continue = false
  end

  def resolve_round
    win_msg = "You win this round."
    lose_msg = "Dealer wins this round."
    push_msg = "A push! No winner this round."
    if blackjacks?
      if @player.hand.blackjack? == @dealer.blackjack?
        puts "Blackjack! But wait you aren't alone. " + push_msg
      elsif @dealer.blackjack?
        puts "Dealer has a blackjack. " + lose_msg
        @player.wallet -= @player.wager
      else
        puts "Blackjack! " + win_msg
        @player.wallet += @player.wager * 1.5
      end
    elsif @player.hand.busted?
      puts "You busted. " + lose_msg
      @player.wallet -= @player.wager
    elsif  @dealer.busted?
      puts "Dealer busted. " + win_msg
      @player.wallet += @player.wager
    elsif @player.hand.get_value < @dealer.get_value
      puts lose_msg
      @player.wallet -= @player.wager
    elsif @player.hand.get_value > @dealer.get_value
      puts win_msg
      @player.wallet += @player.wager
    else
      puts "Push - no winner this round."
    end
    puts
    puts @player.show_wallet
    puts
  end

  def end_game
    msg = "Your final winnings are: #{@player.wallet}. Thanks for playing!"
    exit
  end

  def reshuffle?
    # check if deck is 25 - 50% used up and shuffle if it is
    if @deck.cards.count < Random.rand(13) + 13
      @deck = Deck.new
      @deck.shuffle
    end
  end

  # Additional blackjack actions for future adds: insurance, surrender, split, double
  # Allow for different dealer logic (soft 17)

end

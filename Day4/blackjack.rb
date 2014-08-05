%w{cards hand person}.each { |fname| require "./#{fname}.rb" }
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
    @dealer = Dealer.new
    @player = Player.new(100)
    @invalid_msg = "Please enter a valid response."
    @continue = true
    @stand = false
  end

  def display
    if @dealer.hand.blackjack? || @player.hand.stand
      msg = "Dealer has #{@dealer.hand.to_s}"
    else
      msg = "Dealer is showing #{@dealer.hand}"
    end
    puts msg
    msg = "You have #{@player.hand.to_s}"
    puts msg
    puts
  end

  def deal
    # Message to @player
    @player.bet

    msg = "Dealing cards..."
    puts msg
    puts

    # Create hands
    @player.hand = Hand.new
    @dealer.hand = Hand.new

    # Deal 2 cards each to a player and the dealer
    2.times do |x|
      @player.hand.add_card(deck.deal_card)
      @dealer.hit(deck.deal_card)
    end
  end

  def blackjacks?
      @dealer.hand.blackjack? || @player.hand.blackjack?
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
      if @player.hand.blackjack? == @dealer.hand.blackjack?
        puts "Blackjack! But wait you aren't alone. " + push_msg
      elsif @dealer.hand.blackjack?
        puts "Dealer has a blackjack. " + lose_msg
        @player.wallet -= @player.wager
      else
        puts "Blackjack! " + win_msg
        @player.wallet += @player.wager * 1.5
      end
    elsif @player.hand.busted?
      puts "You busted. " + lose_msg
      @player.wallet -= @player.wager
    elsif  @dealer.hand.busted?
      puts "Dealer busted. " + win_msg
      @player.wallet += @player.wager
    elsif @player.hand.get_value < @dealer.hand.get_value
      puts lose_msg
      @player.wallet -= @player.wager
    elsif @player.hand.get_value > @dealer.hand.get_value
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
    puts msg
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

  def run
    system "clear"
    puts
    puts "Welcome to a Blackjack Table! Let's play."
    puts

    # Play until player does not wish to continue or has an empty wallet
    until !continue

      # Does deck need a reshuffle?
      reshuffle?

      # Deal and show cards
      deal
      display

      # Skip to resolution if dealer or player has a blackjack
      if !blackjacks?

        # If no blackjacks then Player goes first
        until @player.hand.stand || @player.hand.busted? do
          if !@player.hit?
            @player.stood
          else
            @player.hit(deck.deal_card)
            display
          end
        end

        # If player stood then...
        if @player.hand.stand
          display

          # ...the Dealer Goes
          until @dealer.stand? || @dealer.hand.busted? do
            puts "Dealer hits..."
            @dealer.hit(deck.deal_card)
            display
          end
        end
      end

      # Round Resolution
      resolve_round

      # Check wallet and ask to continue
      if @player.broke?
        puts "You are out of money, thanks for playing. Goodbye."
        exit
      else
        continue?
        system "clear"
      end
    end
    end_game
  end
end

if $PROGRAM_NAME == __FILE__
  Blackjack.new.run
end

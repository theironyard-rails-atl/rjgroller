%w{cards hand player}.each { |fname| require "./#{fname}.rb" }

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
    msg = "Dealer is showing #{@dealer.hand[1]}"
    puts msg

    msg = "You have #{@player.hand.to_s}"
    puts msg
  end

  def wallet_empty?
    @player.wallet == 0
  end

  def hit?
    # Prompt user for action
    rxp = /[sS|hH]/
    msg = "Woud you like to (S)tand or (H)it?"
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

    # Create hands
    @player.hand = Hand.new
    @dealer = Hand.new

    # Deal 2 cards each to a player and the dealer
    2.times do |x|
      @player.hand.add_card(deck.deal_card)
      @dealer.add_card(deck.deal_card)
    end
  end

  def hit(person)
    person.hand.add_card(deck.deal_card)
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
    if @player.hand.busted? || @player.hand.get_value < @dealer.get_value
      @player.wallet -= @player.wager
      puts "You lost this round."
    elsif @dealer.busted? || @player.hand.get_value > @dealer.get_value
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
    # check if deck is 25 - 50% used up and shuffle if it is
    if @deck.cards.count < Random.rand(13) + 13
      @deck = Deck.new
      @deck.shuffle
    end
  end

  # def split
  # end
  # def double
  # end
  # def surrender
  # end

end

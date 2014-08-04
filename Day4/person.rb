require "./hand.rb"

class Person

  def initialize
    @hand = Hand.new
  end

  def hit(draw_card)
    @hand.add_card(draw_card)
  end

end

class Player < Person
  attr_accessor :wallet
  attr_accessor :wager
  attr_accessor :hand

  def initialize(starting_money)
    @wallet = starting_money
    super
  end

  def bet
    rxp = /\d+/
    msg = "What is your bet? $"
    print msg
    bet = gets.chomp
    until rxp === bet && bet.to_i <= @wallet do
      puts "Please enter a valid amount"
      puts msg
      bet = gets.chomp
    end
    @wager = bet.to_i
    @wager
  end

  def show_wallet
    "You have $#{@wallet} in your wallet"
  end

  def stand
    @hand.stand = true
  end
end

class Dealer < Person

  attr_accessor :hand

  def stand?
    @hand.get_value >= 17
  end

end

require "./hand.rb"

class Player

  attr_accessor :wallet
  attr_accessor :wager
  attr_accessor :hand

  def initialize(starting_money)
    @wallet = starting_money
    @hand = Hand.new
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

end

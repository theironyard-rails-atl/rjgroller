require "./hand.rb"
require "pry"

class Player

  attr_reader :wallet
  attr_reader :wager

  def initialize(starting_money)
    @wallet = starting_money
    @hand = Hand.new
  end

  def bet
    rxp = /\d+/
    msg = "What is your bet?: $"
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

  def wallet
    "You have $#{@wallet} in your wallet"
  end

end

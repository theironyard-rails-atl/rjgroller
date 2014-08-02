require "./cards.rb"
require "./blackjack.rb"
require "pry"

game = BlackJack.new
game.deal

# Player
unless game.player.bust?
  if game.choice = 1
    if game.dlr_stands?
      if game.player.get_value > game.dealer.get_value
        puts ""

# Dealer


# Resolution


# Deal (or reshuffle and deal)




binding.pry

require "./blackjack.rb"
require "pry"

# Initialize the Game
game = Blackjack.new
game.deal

# ROUND (cycles until quit)
# player makes bet or exits games
!game.continue? ? exit :


# Does deck need a reshuffle?
game.reshuffle?

# deal cards
game.deal

# Player goes
#      if hit -> if not busted continue with dealer
#           busted go to resolution
#      stand  and continue with dealer
#
# Dealer goes
#      show whole hand
#      hit
#      stand
#      busted
#
# Resolve round
#      if player busted or < dealer, lose
#      if dealer busted or >dealer, win
#      else push
#
# Payout
#      If push skip
#      if lose decrement bankroll
#      if win  increment bankroll
#
# Prompts to play again
#
# END
# Destroy blackjack object

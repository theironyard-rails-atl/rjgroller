require ."/cards.rb"
require "./blackjack.rb"

# class BlackJack
# #move to script
# # score, outcome, in_play, deck, player, dealer
# # Deal, Hit, Stand, Surrender
# end

deck = Deck.new

# Deal a new game
player = Hand.new
dealer = Hand.new

# Deal cards for hand
2.times do
  player.add_card(deck.deal_card)
  dealer.add_card(deck.deal_card)

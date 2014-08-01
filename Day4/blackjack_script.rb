require "./cards.rb"
require "./blackjack.rb"
require "pry"

deck = Deck.new
deck.shuffle

player = Hand.new
dealer = Hand.new

player.add_card(deck.deal_card)
player.add_card(deck.deal_card)
puts dealer.add_card(deck.deal_card)
puts dealer.add_card(deck.deal_card)
puts player.hand.to_s
puts "Dealer's Hand #{dealer.hand}"

puts player.get_value
puts dealer.get_value




binding.pry

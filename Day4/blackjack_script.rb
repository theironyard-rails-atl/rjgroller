require "./cards.rb"
require "./blackjack.rb"

deck = Deck.new
deck.shuffle

player = Hand.new
dealer = Hand.new

player.add_card(deck.deal_card)
player.add_card(deck.deal_card)
puts dealer.add_card(deck.deal_card)
puts dealer.add_card(deck.deal_card)
puts "Player's Hand #{player.hand}"
puts "Dealer's Hand #{dealer.hand}"

puts player.get_value
puts dealer.get_value

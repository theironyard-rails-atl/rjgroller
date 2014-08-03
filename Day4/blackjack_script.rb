require "./blackjack.rb"
require "pry"

# Initialize the Game
game = Blackjack.new

system "clear"
puts
puts "Welcome to a Blackjack Table! Let's play."
puts

# Play until player does not wish to continue or has an empty wallet
until !game.continue || game.wallet_empty?

  # Does deck need a reshuffle?
  game.reshuffle?

  # Deal and show cards
  game.deal
  puts
  game.display
  puts

  # Skip to resolution if dealer or player has a blackjack
  if !game.blackjacks?

    # If no blackjacks then Player goes first
    until game.player.hand.stand || game.player.hand.busted? do
      if !game.hit?
        game.player.hand.stand = true
      else
        game.player.hand.add_card(game.deck.deal_card)
      end
    end

    # if player stood then...
    if game.player.hand.stand?

      # ...the Dealer Goes
      until game.dealer.stand? || game.dealer.busted? do
        game.display # show dealer's hidden card
        game.dealer.add_card(game.deck.deal_card)
      end
    end

  # else
  #   if game.dealer.blackjack?
  #     "Dealer has a blakjack!"

  end

  # Round is Resolved
  game.resolve_round
  game.continue?

end

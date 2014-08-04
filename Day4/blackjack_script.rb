require "./blackjack.rb"
require "pry"

# Initialize the Game
game = Blackjack.new

system "clear"
puts
puts "Welcome to a Blackjack Table! Let's play."
puts

# Play until player does not wish to continue or has an empty wallet
until !game.continue

  # Does deck need a reshuffle?
  game.reshuffle?

  # Deal and show cards
  game.deal
  game.display

  # Skip to resolution if dealer or player has a blackjack
  if !game.blackjacks?

    # If no blackjacks then Player goes first
    until game.player.hand.stand || game.player.hand.busted? do
      if !game.hit?
        game.player.stand
      else
        game.player.hand.add_card(game.deck.deal_card)
        game.display
      end
    end

    # If player stood then...
    if game.player.stand
      game.display

      # ...the Dealer Goes
      until game.dealer.stand? || game.dealer.hand.busted? do
        puts "Dealer hits..."
        game.dealer.hit(game.deck.deal_card)
        game.display
      end
    end
  end

  # Round Resolution
  game.resolve_round

  # Check wallet and ask to continue
  if game.wallet_empty?
    puts "You are out of money, thanks for playing. Goodbye."
    exit
  else
    game.continue?
    system "clear"
  end
end
game.end_game

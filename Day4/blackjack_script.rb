require "./blackjack.rb"
require "pry"

# Initialize the Game
game = Blackjack.new
game.deal

# Begin a Hand
# player makes bet or exits games
until !game.continue? || game.wallet_empty?

  # Does deck need a reshuffle?
  game.reshuffle?

  # Deal cards
  game.deal

  if !game.blackjack

    # Player goes
    until game.player.stands? || game.player.busted?
      game.dispay
      game.prompt
      game.hit(@player)
    end

    if game.player.stands?

      # Dealer Goes
      until game.dealer.stands || game.dealer.busted?
        game.display # show dealer's hidden card
        game.hit(@dealer)
      end
    end
  end

  # Round is Resolved
  game.resolve_round
  game.continue?

end

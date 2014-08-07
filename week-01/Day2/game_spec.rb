require "minitest/autorun"
require "./guessing_game_notes.rb"

describe GuessingGame do

  it "isn't finished when it starts" do
    game = GuessingGame.new
    assert game.finished? == false
  end

  it "can be won by guessing the right number" do
    game = GuessingGame.new(7)
    game.guess(7)
    assert_equal game.finished?, true
    assert_equal game.won?, true
  end

  it "tells you whether guess was low" do
    game = GuessingGame.new(15)
    hint = game.guess(10)
    assert_equal hint, :low
  end

  it "tells you whether guess was high" do
    game = GuessingGame.new(30)
    hint = game.guess(90)
    assert_equal hint, :high
  end

  it "counts down the tries" do
    game = GuessingGame.new(21)
    assert_equal game.tries_left, 5
    game.guess(7)
    assert_equal game.tries_left, 4
  end

  it "lose when you run out of guesses" do
  end

end

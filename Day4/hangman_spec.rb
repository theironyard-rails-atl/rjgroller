require "minitest/autorun"
require "./hangman.rb"

describe(Hangman) do

  it "isn't finished when it starts" do
      game = Hangman.new("apple")
      assert_equal game.finished?, false
  end

  it "let's players make a guess" do
    game = Hangman.new("cat")
    assert_equal game.guess("a"), false
  end

  it "can be solved by guessing the word"

  it "is over when you run out of guesses"

  it "displays correctly guessed letters on the board"

  it "only lets you guess from available letters"

  it "is case sensitive"

  it "lets a player know how many guesses they have left"

end

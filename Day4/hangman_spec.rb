require "minitest/autorun"
require "./hangman.rb"

describe(Hangman) do

  it "isn't finished when it starts" do
      game = Hangman.new("apple")
      assert_equal game.finished?, false
  end

  it "let's players make a guess" do
    game = Hangman.new("cat")
    assert_equal game.guess("f"), false
  end

  it "removes letters from available letters after a guess" do
    game = Hangman.new("Banana")
    starting = game.available_letters
    game.guess(starting.first)
    assert_equal game.available_letters.count, starting.count - 1
  end

  it "lets a player know how many misses they have left" do
    game = Hangman.new("farmer")
    assert_equal game.misses_remaining, 6
  end

  it "only lets you guess from available letters" do
    game = Hangman.new("copter")
    game.guess("x")
    assert_equal game.misses_remaining, 5
    game.guess("x")
    assert_equal game.misses_remaining, 5
  end

  it "can be solved by guessing the word" do
    game = Hangman.new("up")
    game.guess("u")
    game.guess("p")
    assert_equal game.finished?, true
    assert_equal game.won?, true
  end

  it "is over after 6 bad guesses" do
    game = Hangman.new("up")
    ('a'..'f').each { |letter| game.guess(letter) }
    assert_equal true, game.finished?
    assert_equal true, game.lost?
  end

  it "displays correctly guessed letters on the board" do
    game = Hangman.new("banana")
    game.guess("a")
    assert_equal "_a_a_a", game.board
  end

  it "is case sensitive" do
    game = Hangman.new("do")
    game.guess("D")
    assert_equal "d_", game.board
  end

end

require "./cards.rb"
require "./hand.rb"
require "minitest/autorun"

describe Card do

  it "knows rank of a number" do
    card = Card.new(2, :H)
    assert_equal 2, card.rank
  end

  it "knows rank of a face card" do
    [:K, :Q, :J].each do |rank|
      card = Card.new(rank, :H)
      assert_equal rank, card.rank
    end
  end

  it "knows its rank" do
    card = Card.new(:A, :D)
    rank = card.rank
    assert_equal :A, rank
  end
end

describe Deck do
  def setup
    @deck = Deck.new
  end

  it "has the right number of cards" do
    assert_equal @deck.cards.count, 52
  end

  it "knows how many cards are left after drawing" do
    @deck.deal_card
    assert_equal @deck.cards.count, 51
  end

  it "tracks which cards have been drawn and which remain" do
    drawn_card = @deck.deal_card
    assert_equal @deck.cards.count, 51
    refute_includes @deck.cards, drawn_card
    assert_includes @deck.drawn_cards, drawn_card
  end
end

describe Hand do
  def setup
    @hand = Hand.new
  end

  it "computes values with number cards" do
    @hand.add_card(Card.new(9, :H), Card.new(7, :S))
    assert_equal @hand.get_value, 16

    @hand.add_card(Card.new(4, :D))
    assert_equal @hand.get_value, 20
  end

  it "computes values with face cards" do
    @hand.add_card(Card.new(9, :H), Card.new(:K, :S))
    assert_equal @hand.get_value, 19
  end

  it "computes values with aces" do
    @hand.add_card(Card.new(:A, :H), Card.new(:K, :S))
    assert_equal 21, @hand.get_value

    @hand.add_card(Card.new(5, :S))
    assert_equal 16, @hand.get_value
  end

  it "can bust" do
    @hand.add_card(Card.new(6, :H), Card.new(:K, :S), Card.new(9, :H))
    assert @hand.busted?
  end

  it "knows a blackjack" do
    @hand.add_card(Card.new(:A, :H), Card.new(:K, :S))
    assert @hand.blackjack?
  end

  it "can be printed to string" do
    @hand.add_card(Card.new(:A, :H), Card.new(:K, :S))
    @hand.add_card(Card.new(5, :S))
    assert_equal @hand.to_s, 'AH, KS, 5S'
  end

  it "knows the value of a hand with multiple aces" do
    @hand.add_card(Card.new(:A, :H), Card.new(:A, :S), Card.new(:A, :C))
    assert_equal 13, @hand.get_value
  end

end

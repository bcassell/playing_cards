require "./spec_helper"

describe Deck do
  it "has a reasonable string representation" do
    deck = Deck.new

    io = IO::Memory.new
    deck.to_s(io)

    cards = io.to_s.split("\n")

    Suit.each do |s|
      Rank.each do |r|
        cards.should contain("#{r} of #{s}")
      end
    end
  end

  it "can be shuffled repeatedly" do
    deck = Deck.new

    io = IO::Memory.new
    second_io = IO::Memory.new

    deck.to_s(io)

    deck.shuffle!

    deck.to_s(second_io)

    io.to_s.should_not eq(second_io.to_s)
  end

  it "can be dealt" do
    deck = Deck.new

    cards = deck.deal(3)

    cards.size.should eq(3)
  end

  it "can be dealt until cards run out" do
    deck = Deck.new

    cards = deck.deal(25)
    more_cards = deck.deal(25)

    expect_raises(Exception, "Requested to deal more cards than are in the deck.") do
      deck.deal(5)
    end
  end

  it "can be reshuffled into a full deck again" do
    deck = Deck.new

    deck.deal(25)
    deck.reshuffle!

    cards = deck.deal(52)

    cards.size.should eq(52)
  end
end

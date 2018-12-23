require "./spec_helper"

describe Card do
  it "has getters for suit and rank" do
    card = Card.new(Suit::Hearts, Rank::Ace)

    card.suit.should eq(Suit::Hearts)
    card.rank.should eq(Rank::Ace)
  end

  it "has a reasonable string representation" do
    card = Card.new(Suit::Hearts, Rank::Ace)

    io = IO::Memory.new
    card.to_s(io).to_s.should eq("Ace of Hearts")
  end
end

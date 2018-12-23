class Card
  getter suit : Suit
  getter rank : Rank

  def initialize(@suit, @rank)
  end

  def to_s(io)
    io << rank << " of " << suit
  end
end

enum Suit
  Hearts
  Clubs
  Spades
  Diamonds
end

enum Rank
  Ace
  Two
  Three
  Four
  Five
  Six
  Seven
  Eight
  Nine
  Ten
  Jack
  Queen
  King
end

class Deck
  def initialize
    @deck = [] of Card

    reshuffle!
  end

  def shuffle!
    @deck.shuffle!
  end

  def reshuffle!
    @deck.clear

    Suit.each do |s|
      Rank.each do |r|
        @deck << Card.new(s, r)
      end
    end

    shuffle!
  end

  def deal(number : UInt8)
    if (number > @deck.size)
      raise "Requested to deal more cards than are in the deck."
    end

    @deck.pop(number)
  end

  def to_s(io)
    @deck.each do |c|
      c.to_s(io)
      io.puts
    end
  end
end

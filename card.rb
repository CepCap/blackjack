class Card
  attr_reader :rank
  attr_reader :suit

  CARD_RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
  CARD_SUITS = ['♠', '♥', '♣', '♦'].freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

end

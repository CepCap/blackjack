class Deck
  attr_reader :points
  attr_reader :card

  CARD_RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  CARD_SUITS = ['♠', '♥', '♣', '♦'].freeze
  @deck = []

  def initialize
    @card = ''
    shuffle
  end

  def shuffle
    CARD_RANKS.each do |rank|
      CARD_SUITS.each do |suit|
        @deck << [rank, suit]
      end
    end
  end

  def take_card
    @card = @@deck.sample
    @deck.delete(@card)
    @card
  end
end

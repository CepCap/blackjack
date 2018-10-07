require_relative 'card'

class Deck
  attr_reader :points
  attr_reader :card

  def initialize
    @deck = []
    @card = ''
    shuffle
  end

  def shuffle
    Card::CARD_RANKS.each do |rank|
      Card::CARD_SUITS.each do |suit|
        card = Card.new(rank, suit)
        @deck << card
      end
    end
  end

  def take_card
    @card = @deck.sample
    @deck.delete(@card)
    @card
  end
end

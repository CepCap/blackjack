class Card
  attr_reader :card
  
  @@card_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  @@suits = ['♠', '♥', '♣', '♦']

  def initialize
    @card_rank = @@card_ranks.sample
    @card = @card_rank.to_s + @@suits.sample
  end

  def points
    if @card_rank.is_a? Integer
      @points = @card_rank
    elsif @card_rank == 'A'
      @points = 1
    else
      @points = 10
    end
  end

  def check(cards_in_game)
    cards_in_game.include? @card
  end
end

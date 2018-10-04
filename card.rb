class Card
  attr_reader :card
  
  @@card_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  @@suits = ['♠', '♥', '♣', '♦']
  @@cards_in_game = []

  def initialize
    @ace_count
    @card_rank = @@card_ranks.sample
    loop do
      @card = @card_rank.to_s + @@suits.sample
      redo if @@cards_in_game.include? @card
      break
    end
    @@cards_in_game << @card
  end

  def is_ace?
    return @ace
    @ace = false
  end

  def points
    if @card_rank.is_a? Integer
      @points = @card_rank
    elsif @card_rank == 'A'
      @ace = true
      @points = 11
    else
      @points = 10
    end
  end

  def check
    @@cards_in_game.include? self
  end
end

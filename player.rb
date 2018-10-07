require_relative 'deck'

class Player
  attr_accessor :bank
  attr_accessor :points
  attr_accessor :name
  attr_reader :cards_in_hand

  def initialize
    @cards_in_hand = []
    @bank = 100
    @points = 0
    @name = ''
    @aces_in_hand = 0
  end

  def game_start(deck)
    2.times { take_card(deck) }
    @bank -= 10
    @bank = 0 if @bank < 10
    return false if @bank.zero?
  end

  def pass; end

  def take_card(deck)
    card = deck.take_card
    @cards_in_hand << card
    if card.rank =~ (/\A[-+]?\d+\z/)
      @points += card.rank.to_i
    elsif card.rank == 'A'
      @aces_in_hand += 1
      @points += 11
    else
      @points += 10
    end
    (@points -= 10) if points > 21 && @aces_in_hand >= 1
  end

  def clear
    @cards_in_hand = []
    @points = 0
  end
end

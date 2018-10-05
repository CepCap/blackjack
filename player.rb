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
    if card[0].is_a? Integer
      @points += card[0]
    elsif card[0] == 'A'
      @points += (@points += 11) <= 21 ? 11 : 1
    else
      @points = 10
    end
  end

  def clear
    @cards_in_hand = []
    @points = 0
  end
end

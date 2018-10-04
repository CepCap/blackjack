require_relative 'card'

class Player
  attr_reader :name
  attr_accessor :bank
  attr_accessor :points
  attr_reader :cards_in_hand

  def initialize(name)
    @cards_in_hand = []
    @bank = 100
    @points = 0
    @name = name
  end

  def game_start
    2.times { take_card }
    @bank -= 10
    @bank = 0 if @bank < 10
    return false if @bank == 0
  end

  def pass
  end

  def take_card
    new_card = Card.new
    @cards_in_hand << new_card
    @points += new_card.points 
  end

  def clear
    @cards_in_hand = []
    @points = 0
  end
end

require_relative 'card'

class Dealer
  attr_accessor :bank
  attr_accessor :points
  attr_reader :cards_in_hand

  def initialize
    @cards_in_hand = []
    @bank = 100
    @points = 0
  end

  def ace_check
    @cards_in_hand.each do |card| 
      if card.is_ace?
        @points -= 10
        break
      end 
    end
  end

  def game_start
    2.times { take_card }
    @bank -= 10
    @bank = 0 if @bank < 10
    return false if @bank == 0
  end

  def turn
    @points < 17 ? take_card : pass
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

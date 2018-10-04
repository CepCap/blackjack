class Dealer
  @cards_in_hand = []
  @bank = 100
  @points = 0

  def game_start
    2.times { take_card }
    @bank -= 10
    @bank = 0 if @bank < 10
  end

  def turn
    @points < 17 ? take_card : pass
  end

  def pass
  end
  
  def take_card(cards)
  end

end
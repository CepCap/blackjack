class Player
  @cards_in_hand = []
  @bank = 100
  @points = 0

  def game_start
    2.times { take_card }
    @bank -= 10
    @bank = 0 if @bank < 10
  end

  def turn
  end

  def pass
  end

  def take_card
  end

  def reveal
  end

end
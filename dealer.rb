require_relative 'player'

class Dealer < Player

  def turn(deck)
    @points < 17 ? take_card(deck) : pass
  end
end

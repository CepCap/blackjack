require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  attr_reader :victory
  attr_reader :player
  attr_reader :dealer
  attr_reader :turn_end

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @turn_end = false
  end

  def player_name
    @player.name = gets.chomp
  end

  def game_start!
    @player.game_start(@deck)
    @dealer.game_start(@deck)
  end

  def turn
    @dealer.turn(@deck)
    @turn_end = true if @dealer.points > 21
    player_choice
    @turn_end = true if @player.points == 21 || @player.points > 21
    reveal if @turn_end == true
  end

  def player_choice
    choice = gets.to_i
    @player.take_card(@deck) if choice == 1
    @player.pass if choice == 2
    @turn_end = true if choice == 3
  end

  def reveal
    if @player.points > @dealer.points && @player.points < 22 || @dealer.points > 22
      @victory = 'player'
      @player.bank += 20
    elsif @player.points == @dealer.points && @player.points < 22
      @victory = 'draw'
      @player.bank += 10
      @dealer.bank += 10
    else
      @dealer.bank += 20
    end
  end

  def clear
    @victory = ''
    @player.clear
    @dealer.clear
  end

  def play_again?
    choice = gets.chomp.downcase
    return true if choice == 'y'
    return false if choice == 'n'
  end
end

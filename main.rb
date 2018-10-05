require_relative 'game'
require_relative 'interface'

interface = Interface.new
game = Game.new

interface.introduction
game.player_name
interface.hello(game.player.name)
loop do
  loop do
    game.game_start!
    interface.turn(game.dealer,game.player)
    interface.player_choice
    game.turn
    interface.reveal(game.victory, game.dealer, game.player) if game.turn_end
    game.clear
  end
  interface.play_again
  break unless game.play_again?
end

exit

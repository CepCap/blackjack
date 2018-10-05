require_relative 'game'
require_relative 'interface'

interface = Interface.new
game = Game.new(interface.introduction)

interface.hello(game.player.name)
loop do
  loop do
    game.game_start!
    loop do
      interface.turn(game.dealer, game.player)
      game.turn(interface.player_choice)
      break if game.turn_end
    end
    interface.reveal(game.victory, game.dealer, game.player)
    game.clear
  end
  break unless game.play_again?(interface.play_again)
end

exit

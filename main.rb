#core of the game is here
require_relative 'card'
require_relative 'player'
require_relative 'dealer'

@dealer = Dealer.new
puts 'Введите ваше имя'
@player = Player.new(gets.chomp)
puts "Здраствуйте, #{player.name}! Начинаем игру!"
@table_bet = 0

loop
@table_bet += 20
@dealer.game_start
@player.game_start

end

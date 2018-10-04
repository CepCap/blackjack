#core of the game is here
require_relative 'card'
require_relative 'player'
require_relative 'dealer'

@dealer = Dealer.new
puts 'Введите ваше имя'
@player = Player.new(gets.chomp)
puts "Здраствуйте, #{@player.name}! Начинаем игру!"
@table_bet = 0

loop do
  @dealer.game_start
  @player.game_start
  @table_bet += 20
  loop do
    puts "Ваш банк: #{@player.bank}"
    puts "Фишки  на кону: #{@table_bet}"
    puts "Карты дилера: #{"* " * (@dealer.cards_in_hand.length) }"
    puts "Ваши карты: #{@player.cards_in_hand.join(' ')}"
    puts "Очки: #{@player.points}"
    puts "Ваш ход!"
    puts "1. Взять карту."
    puts "2. Пропустить ход."
    puts "3. Вскрываемся."
    user_input = gets.to_i
    @player.take_card if user_input == 1
    @player.pass if user_input == 2
    @player.reveal if user_input == 3
    @dealer.turn
  end
end

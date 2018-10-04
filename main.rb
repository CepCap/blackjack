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
  loop do
    puts "Ваш банк: #{@player.bank}"
    puts "Фишки  на кону: 20"
    puts "Карты дилера: #{"* " * (@dealer.cards_in_hand.length) }"
    puts "Ваши карты: #{@player.cards_in_hand.map(&:card).join(" ") }"
    puts "Очки: #{@player.points}"
    puts "Ваш ход!"
    puts "1. Взять карту."
    puts "2. Пропустить ход."
    puts "3. Вскрываемся."
    @dealer.turn
    @dealer.ace_check if @dealer.points > 21
    break if @dealer.points > 21
    user_input = gets.to_i
    @player.take_card if user_input == 1
    @player.pass if user_input == 2
    @player.ace_check if @player.points > 21
    break if user_input == 3 || @player.points == 21 || @player.points > 21
  end
  if @player.points > @dealer.points && @player.points < 22
    (@player.points == 21) ? (puts "Блэкджэк!") : (puts "Вы выиграли!")
    @player.bank += 20
  elsif @player.points == @dealer.points
    puts "Ничья!"
    @player.bank += 10
    @dealer.bank += 10
  else
    puts "Вы проиграли!"
    @dealer.bank += 20
  end
  puts "Карты дилера: #{@dealer.cards_in_hand.map(&:card).join(" ")}"
  puts "Ваши карты: #{@player.cards_in_hand.map(&:card).join(" ")}"
  puts "Сыграем ещё? Y/N"
  @dealer.clear
  @player.clear
  user_input = gets.chomp.downcase
  break if user_input == "n"
end

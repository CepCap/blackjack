class Interface

  def introduction
    puts "Добро пожаловать! Как вас зовут?"
  end

  def hello(name)
    puts "Отлично, #{name.chomp}. Начинаем игру!"
    puts
  end

  def turn(dealer, player)
    puts "----------"
    puts "Новый кон!"
    puts "----------"
    puts "Ваш банк: #{player.bank}"
    puts "Фишки  на кону: 20"
    puts "Карты дилера: #{"* " * (dealer.cards_in_hand.length) }"
    puts "Ваши карты: #{player.cards_in_hand.flatten.join }"
    puts "Очки: #{player.points}"
    puts "Ваш ход!"
    puts    
  end

  def player_choice
    puts "1. Взять карту."
    puts "2. Пропустить ход."
    puts "3. Вскрываемся."
    puts
  end

  def reveal(victory, dealer, player)
    if victory == 'player'
      puts "************"
      print "Блэкджэк! " if player.points == 21
      puts "Вы победили!"
      puts "************"
    elsif victory == 'draw'
      puts "************"
      puts "Ничья!"
      puts "************"
    else
      puts "************"
      puts "Вы проиграли!"
      puts "************"
    end
    puts "Карты дилера: #{dealer.cards_in_hand.flatten.join(" ")}"
    puts "Ваши карты: #{player.cards_in_hand.flatten.join(" ")}"
    puts "Очки дилера: #{dealer.points}"
    puts "Ваши очки: #{player.points}"
    puts
  end

  def play_again
    puts "Сыграем еще? (Y/N)"
  end
end

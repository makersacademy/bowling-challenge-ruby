require './lib/game'

game = Game.new

(1..10).each do |frame|
  puts "Frame #{frame}:"
  print "Enter first roll: "
  first_roll = gets.chomp.to_i
  game.roll(first_roll)
  
  if first_roll == 10
    puts "You got a strike!"
    if frame == 10
        puts "Bonus Frame (Strike):"
        print "Enter first bonus roll: "
        first_bonus_roll = gets.chomp.to_i
        game.roll(first_bonus_roll)

        print "Enter second bonus roll: "
        second_bonus_roll = gets.chomp.to_i
        game.roll(second_bonus_roll)
    end
    next
  end

  print "Enter second roll: "
  second_roll = gets.chomp.to_i
  game.roll(second_roll)
  
  if first_roll + second_roll == 10
    puts "You got a spare!"
    if frame == 10
      puts "Bonus Frame (Spare):"
      print "Enter bonus roll: "
      bonus_roll = gets.chomp.to_i
      game.roll(bonus_roll) 
    end
  end
end
  
puts "Your score is: #{game.score}"
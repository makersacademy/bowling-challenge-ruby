class Game
  def self.play 
    i = 0
    score = 0
    round = 0
    knocked_over_pins = 0
    while round < 20 
      if i == 0  
        puts "Please enter your score..."
        userscore = gets.chomp.to_i
          if userscore == 10 
            puts "Strike!"
            score += 20
            knocked_over_pins += userscore
            i += 1
          else 
            score += userscore
            knocked_over_pins += userscore
          end
        i += 1
      elsif i == 1 
        puts "Please enter your score..."
        userscore = gets.chomp.to_i
        if (knocked_over_pins + userscore) == 10
          puts "Spare!"
          score += 20
          knocked_over_pins += userscore
        else 
          score += userscore
          knocked_over_pins += userscore
        end
        i += 1
      else 
        if knocked_over_pins == 0
          i = 0 
          puts "\nBad Luck!"
          puts "Your total score is #{score}"
          puts "You knocked over #{knocked_over_pins} pins this round!"
          round += 1 
          knocked_over_pins = 0
        else
          i = 0
          puts "Your total score is #{score}"
          puts "You knocked over #{knocked_over_pins} pins this round!"
          round += 1 
          knocked_over_pins = 0
        end
      end 
    end
    puts "Game Over.... You Finished with a score of #{score}"
  end
end
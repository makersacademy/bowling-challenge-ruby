class Game
  def initialize
    @rolls = []
    @current_roll = 0
    @score_board = [0,0,0,0,0]
  end

  def roll(pins_knocked)
    @rolls[@current_roll] = pins_knocked
    @current_roll += 1
  end

  def score
    accumulated_score = 0
    frame_index = 0
    (1..10).each do
      if @rolls[frame_index] == 10
        accumulated_score += 10 + bonus_for_strike(frame_index).to_i
        frame_index += 1
      elsif @rolls[frame_index] + @rolls[frame_index + 1] == 10
        accumulated_score += 10 + bonus_for_spare(frame_index).to_i
        frame_index += 2
      else
        accumulated_score += @rolls[frame_index].to_i + @rolls[frame_index + 1].to_i
        frame_index += 2
      end
    end
    return accumulated_score.to_i
  end

  def show_final_board
  #def show_final_board(player, frames, score)
    @score_board.each do |score|
      score
    end
    # shows the final score board with players' names
    # from players
    # from frames
  end

  private

  def bonus_for_strike(frame_index)
    @rolls[frame_index + 1].to_i + @rolls[frame_index + 2].to_i
  end

  def bonus_for_spare(frame_index)
    @rolls[frame_index + 2].to_i
  end
end

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
require_relative 'frame'
require_relative 'score'

class Game
  attr_reader :frame
  def initialize
    @frame_class = Frame
    @frame = 0
    @score = Score.new
    @game_score = Array.new(10, 0)
  end

  def roll
    if @frame == 9
      roll1, roll2, roll3 = @frame_class.new.frame_10_start
      returned = @score.calculate_frame10(roll1, roll2, roll3)
      store_score(returned[0], returned[1], returned[2])
    else
      roll1, roll2, bonus = @frame_class.new.frame_start
      returned = @score.calculate(roll1, roll2, bonus)
      store_score(returned[0], returned[1], returned[2])
    end
    @frame += 1
  end

  def store_score(score, bonus_score, previous_bonus_score)
    @game_score[@frame] += score
    if @frame >= 1 && @frame < 2
       @game_score[@frame - 1] += bonus_score
    elsif @frame > 1
      @game_score[@frame - 1] += bonus_score
      @game_score[@frame - 2] += previous_bonus_score
    end
    puts "score = #{@game_score}"
    puts "Game over. Total score = #{@game_score.sum}" if @frame == 9
  end

  def quit
    puts "Thank you for playing"
    exit
  end

  def play
    puts "Welcome to ten pin bowling."
    puts "What would you like to do?"
    while true
      break if @frame == 10
      action = gets.chomp
      case action
      when "frame" || "Frame"
        puts @frame
      when "roll" || "Roll"
        roll
      when "quit" || "Quit"
        quit
      else
        puts "Command not recognised. Try 'frame, roll or quit'"
      end
      puts "What would you like to do?" unless @frame == 10
    end
  end
end

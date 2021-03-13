require_relative 'frame'

class Game
  attr_reader :frames, :rolls, :score
  MAX_FRAMES = 10

  def initialize
    @max_frames = MAX_FRAMES
    @frames = []
    @score =[]
  end

  # lets create a frame and roll for it

  def play_game
    until @frames.length == @max_frames
      frame = Frame.new      
      until frame.completed?
        puts 'Number of pins knocked down'
        pins = gets.chomp.to_i
        frame.roll(pins)
      end
      @frames << frame
    end
  end

# def game_score
#   i = 0
#   while i <= @frames.length
#     puts @frames[i]
#     strike_score(@frames[i], @frames[i + 1]) if @frames[i].strike?
#     spare_score(@frames[i], @frames[i + 1]) if @frames[i].spare?
#     standard_score(@frames[i])
#     i += 1
#   end
# end

  def game_score
    @frames.each_index do | index |
      if @frames[index].strike? 
        @score << strike_score(@frames[index], @frames[index + 1])
      elsif @frames[index].spare? 
        @score << spare_score(@frames[index], @frames[index + 1])
      else
        @score << standard_score(@frames[index])
      end
    end
  end


  private
  
  def standard_score(frame)
    frame.score
  end

  def strike_score(frame, next_frame)
    frame.score + next_frame.score
  end

  def spare_score(frame, next_frame)
    frame.score + next_frame.rolls[0]
  end

end
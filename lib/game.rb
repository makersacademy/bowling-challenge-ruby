require './lib/frame'

class Game

  attr_reader :frames

  def initialize(frames = [])
    @frames = frames
  end

  def total_score
    @frames.sum { |frame| frame.score }
  end

  def add_frame(frame)
    analyse_frame(frame)
    @frames << frame
  end

  private

  def analyse_frame(analysed_frame)
    @frames.each do |frame| 
      if analysed_frame.strike? 
        if frame.bonus_rolls > 0
          frame.add_points(analysed_frame.roll_1)
          frame.bonus_rolls -= 1
        end
      else
        if frame.bonus_rolls == 2
          frame.add_points(analysed_frame.roll_1 + analysed_frame.roll_2)
          frame.bonus_rolls -= 2
        elsif frame.bonus_rolls == 1
          frame.add_points(analysed_frame.roll_1)
          frame.bonus_rolls -= 1
        end
      end
    end
  end
end

# game = Game.new

# game.add_frame(Frame.new(10, nil))
# game.add_frame(Frame.new(5, 5))
# game.add_frame(Frame.new(10, nil))
# game.add_frame(Frame.new(5, 3))
# game.add_frame(Frame.new(0, 0))
# game.add_frame(Frame.new(10, nil))
# game.add_frame(Frame.new(10, nil))
# game.add_frame(Frame.new(9, 1))
# game.add_frame(Frame.new(5, 5))
# game.add_frame(Frame.new(9, 0))

# p game.frames.length
# p game.total_score

# take a frame
# check if it is a strike
# if it is a strike
# add the first

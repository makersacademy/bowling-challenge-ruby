require 'frame'

class Game
  def initialize(io)
    @io = io
    @scoreboard = {
      frame_1: [], 
      frame_2: [],
      frame_3: [],
      frame_4: [],
      frame_5: [],
      frame_6: [],
      frame_7: [],
      frame_8: [],
      frame_9: [],
      frame_10: []
      }
  end

  def game_scores
    return @scoreboard
  end

  def play
    frame = Frame.new
    ball_1 = @io.gets.chomp.to_i
    @scoreboard[:frame_1] << frame.ball_1(ball_1)
    ball_2 = @io.gets.chomp.to_i
    @scoreboard[:frame_1] << frame.ball_2(ball_2)
  end

end
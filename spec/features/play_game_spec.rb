class Game
  def self.play
    game = Game.new 
    until game.next_frame == 10
      game.play_frame
      next_frame += 1
    end
    game.play_frame(:last)
  end

  attr_reader :next_frame, :scoresheet 

  def initialize(scoresheet = Scoresheet.new, frame = Frame)
    @starting_frame = 1
    @next_frame = @starting_frame + 1
    @scoresheet = scoresheet
    @frame = frame

  end

  private

  def play_frame(type = :standard)
    unless type == :last
      result = frame.standard_play
    else
      result = frame.play_last
    end
    game.scoresheet.update(frame_result)
    game.scoresheet.display
  end
end

class Scoresheet
  def update(result)

  end

  def final_score

  end

end

class Frame
  def self.standard_play

  end

  def self.play_last
end

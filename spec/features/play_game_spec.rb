class Game
  def self.play
    game = Game.new 
    while game.next_frame < 10
      game.play_frame
      game.display_scoresheet
      next_frame += 1
    end
      game.play_frame(:last)
      game.display_scoresheet
    end
    
    
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
    game.scoresheet.update_score(result)
  end

  def display_scoresheet
    game.scoresheet.display
  end
end

class Scoresheet
  def update_score(result)
    tally_basic_points
    tally_bonus_points
  end

  def display

  end

  private

  def tally_basic_points

  end

  def tally_bonus_points

  end

end

class Frame
  def self.standard_play

  end

  def self.play_last
    
  end
end

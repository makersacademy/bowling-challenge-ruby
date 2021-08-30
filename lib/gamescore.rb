require_relative './framescore'

class GameScore

  attr_reader :game

  def initialize(frame_rolls = FrameScore.new)
    @frame_score = frame_rolls
    @game = {
      frame_1: [],
      frame_2: [],
      frame_3: [],
      frame_4: [],
      frame_5: [],
      frame_6: [],
      frame_7: [],
      frame_8: [],
      frame_9: [],
      frame_10: [],
    }
  end

  def input_frame_score(first_roll, second_roll)
    @frame_score.single_frame_roll(first_roll)
    @frame_score.single_frame_roll(second_roll)
    store_frame_rolls(@frame_score.frame_rolls)
    @frame_score.frame_rolls
  end

  def display_frame_points
    @summed_frame_points
  end

  def display_total_points
    summed_total_points
  end

  def clear_frame_rolls
    @frame_score.clear
  end

  private

  def store_frame_rolls(frame_rolls_scores)
    @game.select do |key, value|
      if value == []
        @game[key] = frame_rolls_scores
        summed_frame_points(frame_rolls_scores)
        break
      end
    end
  end

  def summed_frame_points(frame_points)
    @summed_frame_points = frame_points.sum
  end

  def summed_total_points
    @game.values.flatten.sum
  end
  
end

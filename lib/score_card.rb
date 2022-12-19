require 'frame'

class ScoreCard
  def initialize(game)
    @score_card =[]
    @frames = game.all_frames
    @frames_with_scores = game.frames_with_scores
  end

  def score_by_frame
    @frames.each_with_index do |frame, index|
      @next_index = index + 1
      @score_card << (frame.scores.sum + bonus_points(frame))
    end

    return @score_card
  end

  def total_score
    @score_card.sum
  end

  private

  def bonus_points(frame)
    bonus_points = 0
    not_frame_ten = @next_index < 10 

    if frame.strike? && not_frame_ten
      bonus_points = next_two_rolls
    elsif frame.spare? && not_frame_ten
      bonus_points = next_roll
    end

    return bonus_points
  end

  def next_roll
    return (@frames_with_scores.length) > @next_index ? @frames_with_scores[@next_index][0] : 0
  end
  
  def next_two_rolls
    return @frames_with_scores[@next_index..@next_index+1].flatten[0..1].sum
  end
  
end
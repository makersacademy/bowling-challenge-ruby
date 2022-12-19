require 'frame'

class Score
  def initialize(game)
    @score =[]
    @all_frames = game.completed_frames
    @current_frame = game.current_frame
  end

  def score_by_frame
    all_frames.each_with_index do |frame, index|
      @next_index = index + 1
      @score << (frame.scores.sum + bonus_points(frame))
    end

    return @score
  end

  def total_score
    @score.sum
  end

  private

  def all_frames
    if @current_frame != []
      current_frame = Frame.new(@current_frame)
      @all_frames << current_frame
    end
    return @all_frames
  end

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

  def rolls_by_frame 
    rolls_by_frame = []

    @all_frames.each do |frame|
      rolls_by_frame << frame.scores
    end

    return rolls_by_frame
  end

  def next_roll
    return (rolls_by_frame.length) > @next_index ? rolls_by_frame[@next_index][0] : 0
  end
  
  def next_two_rolls
    return rolls_by_frame[@next_index..@next_index+1].flatten[0..1].sum
  end
  
end
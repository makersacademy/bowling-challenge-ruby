require 'frame'

class Score
  def initialize(game)
    @score =[]
    @all_frames = game.completed_frames
    @current_frame = game.current_frame
  end

  def score_by_frame
    all_frames.each_with_index do |frame, index|
      @score << (frame.sum + bonus_points(frame, index + 1 ))
    end

    return @score
  end

  def total_score
    @score.sum
  end

  private

  def all_frames
    if @current_frame != []
      @all_frames << @current_frame
    end
    return @all_frames
  end

  def bonus_points(frame, next_index)
    frame = Frame.new(frame, next_index)
    bonus_points = 0
    next_two_rolls = @all_frames[next_index..next_index+1].flatten[0..1].sum
    next_roll = (@all_frames.length) > next_index ? @all_frames[next_index][0] : 0

    if frame.strike?
      bonus_points = next_two_rolls
    elsif frame.spare?
      bonus_points = next_roll 
    end

    return bonus_points 
  end
  
end
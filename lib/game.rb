require './lib/frame'

class Game
  attr_reader :frames_array, :frame_scores, :state

  def initialize
    @state = nil
    @frames_array = []
    @frame_scores = []
  end

  def turn(frame)
    @frame = frame
    @frames_array << @frame.frame
    score(@frame)
  end

  def score(frame)
    @frame = frame.frame
    bonus_points(@frame)
    score_state(@frame)
    add_score
  end

  private

  def score_state(frame)
    if frame[:first_roll] == 'strike'
      @state = :strike
    elsif frame[:second_roll] == 'spare'
      @state = :spare
    else 
      @state = nil
    end
  end

  def add_score
    if @state == :strike
      @frame_scores << :strike
    elsif @state == :spare
      @frame_scores << :spare
    else
      @frame_scores << @frame[:first_roll] + @frame[:second_roll]
    end
  end

  def bonus_points(new_frame)
    if @state == :strike
      @frame_scores.pop
      @frame_scores << 10 + new_frame[:first_roll] + new_frame[:second_roll]
    elsif @state == :spare
      @frame_scores.pop
      @frame_scores << 10 + new_frame[:first_roll]
    end
  end
end

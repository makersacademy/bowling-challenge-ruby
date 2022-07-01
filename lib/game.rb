class Game

  attr_reader :current_frame

  def initialize
    @scores = []
    @frames = []
    @current_frame = 1
  end

  def add(frame) # frame is an instance of Frame
    @frames << frame
    @current_frame += 1
  end

  def get_frame_score
    @scores = @frames.map do |object|
      object.frame_score
    end
  end

  def score_card
    @frames
  end

  def frame_scores
    if @scores[@current_frame - 3][0] == 10
      @scores << next_frame_score
    elsif @scores[@current_frame - 3].inject(:+) == 10
      @scores << next_roll_score
    else
      @scores
    end
  end

  def sum_total 
    frame_scores.flatten.inject(:+)
  end

  def next_frame_score
    @scores[@current_frame - 2].inject(:+)
  end 

  def next_roll_score
    @scores[@current_frame - 2][0]
  end
end
class Round
  attr_reader :basic_score, :bonus_score, :frames
  
  def initialize(frames)
    @frames = frames
    @score = 0
    @basic_score = 0
    @bonus_score = 0
  end

  def score
    calculate_basic_score
    calculate_bonus_score
    @score = @basic_score + @bonus_score
  end
  
  # private

  def calculate_basic_score
    @frames.each do |frame|
      @basic_score += frame.sum
    end
    @basic_score -= final_frame_bonus
  end
  
  def calculate_bonus_score
    score_frames(final_frame_length: @frames.last.length)
  end

  def score_frames(final_frame_length:)
    final_frame_length > 2 ? x = 8 : x = 9
    for i in 0..x do
      if @frames[i][0] == 10
        @bonus_score += (@frames[i+1][0] + @frames[i+1][1])
      elsif frames[i].sum == 10
        @bonus_score += @frames[i+1][0]
      end
    end
    @bonus_score += final_frame_bonus
  end

  def final_frame_bonus
    if @frames.last[0] == 10
      bonus = @frames.last[1] + @frames.last[2]
    elsif @frames.last[0] + @frames.last[1] == 10
      bonus = @frames.last[2]
    else
      bonus = 0
    end
    bonus
  end
end
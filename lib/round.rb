class Round
  def initialize(frames)
    @frames = frames
    @score = 0
    @basic_score = 0
    @bonus_score = 0
  end

  def score
    calculate_basic_score
    calculate_bonus_score(@frames)
    @score = @basic_score + @bonus_score
  end
  
  private

  def calculate_bonus_score(frames)
    for i in 0..9 do
      if frames[i].sum == 10
        @bonus_score += @frames[i+1][0]
      end
      @bonus_score
    end
  end

  def calculate_basic_score
    @frames.each do |frame|
      @basic_score += frame.sum
    end
    @basic_score
  end
end
class Frame
  attr_reader :frame_score, :bonus_score, :multiplier # hide inside methods?

  def initialize(multiplier = 0)
    @frame_score = []
    @bonus_score = 0
    @multiplier = multiplier
  end

  def add_score(num)
    if @frame_score.empty?
      @bonus_score += num if @multiplier != 0
    else
      @bonus_score += num if @multiplier == 2
    end
    
    @frame_score << num
  end

  def last_score
    @frame_score.last
  end

  def close_frame
    @frame_score << 0 if strike?
  end

  private

  def strike?
    @frame_score[0] == 10
  end
end

class Game 
  attr_reader :scores, :frames

  def initialize(player)
    @scores = []
    @frames = [Frame.new]
  end

  def score(num)
    check_input(num)
    @frames.last.add_score(num)
    check_frame
  end

  def last_score
    @frames.last.frame_score.empty? ? @scores.last : @frames.last.frame_score.last
  end

  def check_frame
    new_frame if strike? || @frames.last.frame_score.size == 2
  end

  def new_frame
    @frames.last.close_frame
    raise 'Game over with score x' if gameover? #need to add final score here
    if strike?
      @frames << Frame.new(2)
    elsif spare?
      @frames << Frame.new(1)
    else
      @frames << Frame.new
    end
  end

  private

  def check_input(num)
    raise 'can only accept scores 1-10' unless num.positive? && num <= 10
  end

  def strike?
    @frames.last.frame_score[0] == 10
  end

  def spare?
    @frames.last.frame_score.sum == 10
  end

  def gameover?
    @frames.size == 10
  end
end

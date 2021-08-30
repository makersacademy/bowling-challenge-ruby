class Game 
  attr_reader :scores, :frame

  def initialize(player)
    @scores = []
    @frame = [Frame.new]
  end

  def score(num)
    check_input(num)
    @frame.last.add_score(num)
    check_frame
  end

  def last_score
    @frame.last.frame_score.empty? ? @scores.last : @frame.last.frame_score.last
  end

  def check_frame
    if @frame.last.frame_score[0] == 10 || @frame.last.frame_score.size == 2
      new_frame
    else
      increment_frame
    end
  end

  def new_frame
  end

  def increment_frame
  end
    
  private

  def check_input(num)
    raise 'can only accept scores 1-10' unless num.positive? && num <= 10
  end
end

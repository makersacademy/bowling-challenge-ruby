class Frame
  FRAME_LENGTH = 2
  TOTAL_PINS = 10
  
  attr_reader :number, :scores

  def initialize(frame_number)
    @number = frame_number
    @scores = []
    @bonus = 0
  end

  def score
    p "Scores: #{@scores}"
    @scores.sum + @bonus
  end

  def add(score_to_add)
    raise 'This frame is complete' if @scores.length == FRAME_LENGTH

    @scores << score_to_add
  end

  def rolls
    @scores.length
  end

  def complete?
    return true if strike?

    rolls == FRAME_LENGTH
  end

  def strike?
    @scores.first == TOTAL_PINS
  end

  def spare?
    @scores.length == FRAME_LENGTH && @scores.sum == TOTAL_PINS
  end
end

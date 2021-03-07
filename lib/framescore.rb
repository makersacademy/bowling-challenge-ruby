class FrameScore
  attr_reader :total, :final
  
  def initialize(frame:)
    @frame = frame
    @final = false
    @total = 0
    @bonus_bowls = 0
    @bonus = []
    score_frame
  end

  def add_bonus_bowl(pins:)
    @bonus.push(pins)
    @bonus_bowls -= 1
    complete_bonus if @bonus_bowls == 0
  end

  private

  def score_frame
    @total += @frame.pins if complete?
    @final = true if complete?
    bonus unless complete?
  end

  def complete?
    @frame.pins < 10
  end

  def bonus
    @bonus_bowls = 2 if strike?
    @bonus_bowls = 1 if spare?
  end

  def strike?
    @frame.bowls.length == 1
  end

  def spare?
    @frame.bowls.length == 2
  end

  def complete_bonus
    @total += @frame.pins
    @total += @bonus.sum
    @final = true
  end
end
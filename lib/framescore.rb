class FrameScore
  attr_reader :score, :final
  
  def initialize(frame:)
    @frame = frame
    @final = false
    @score = 0
    @bonus_bowls = 0
    @bonus = []
    score_frame
  end

  def add_bonus_bowl(bowl:)
    @bonus.push(bowl.pins)
    @bonus_bowls -= 1
    complete_bonus if @bonus_bowls == 0
  end

  private

  def score_frame
    @score += @frame.pins if complete?
    @final = true if complete?
    bonus if !complete?
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
    @score += @frame.pins
    @score += @bonus.sum
    @final = true
  end
end
class Game

  def initialize(roll_class = Roll, frame = Frame.new)
    @frames = []
    10.times { @frames << frame }
    @roll_class = roll_class
  end

  def roll(pins)
    roll = @roll_class.new(pins)
    @frames.each do |frame|
      ended?(frame) ? next : (return add(roll, frame))
    end
  end

  def score
    index = 0
    score = 0
    10.times do
      score += score_frame(index)
      score += spare_bonus(index) if spare_frame?(index)
      score += strike_bonus(index) if strike_frame?(index)
      index += 1
    end
    score
  end

  private

  def score_frame(index)
    @frames[index].score
  end

  def spare_frame?(index)
    @frames[index].spare?
  end

  def spare_bonus(index)
    @frames[index + 1].roll_1
  end

  def strike_frame?(index)
    @frames[index].strike?
  end

  def strike_bonus(index)
    score_frame(index + 1)
  end

  def ended?(frame)
    frame.ended?
  end

  def add(roll, frame)
    frame.add(roll)
  end
end

class Game

  def initialize(roll_class = Roll, frame = Frame.new)
    @frames = []
    10.times { @frames << frame }
    @roll_class = roll_class
  end

  def roll(pins)
    roll = @roll_class.new(pins)
    @frames.each do |frame|
      if frame.ended?
        next
      else
        return frame.add(roll)
      end
    end
  end

  def score
    i = 0
    score = 0
    10.times do
      score += @frames[i].score
      if @frames[i].spare?
        score += @frames[i + 1].roll_1
      elsif @frames[i].strike?
        score += @frames[i + 1].score
      end
      i += 1
    end

    score
  end
end

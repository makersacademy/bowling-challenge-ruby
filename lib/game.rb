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
      # if previous_frame.spare?
      #   @score += frame.roll_1
      # end
    end

    score
  end
end

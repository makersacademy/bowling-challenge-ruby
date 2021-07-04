class Game

  def initialize(roll_class = Roll, frame = Frame.new)
    @score = 0
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
        frame.add(roll)
      end
    end
  end

  def score
    @frames.each do |frame|
      @score += frame.score
    end

    @score
  end
end

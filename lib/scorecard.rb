class Scorecard
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add(frame)
    frame.number = @frames.length + 1
    frames.push(frame)
  end

  def score
    total = 0
    @frames.each_with_index do |frame, index|
      total += frame.score(@frames[index + 1], @frames[index + 2])
    end
    total
  end
end

class Scorecard
  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(n, frame_class = Frame)
    if @frames.empty?
      frame = frame_class.new
      add(frame)
    elsif @frames.last.complete?
      frame = frame_class.new
      add(frame)
    else
      frame = @frames.last
    end
    frame.roll(n)
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

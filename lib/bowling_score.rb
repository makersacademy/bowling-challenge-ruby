require 'frame'

class BowlingScore
  MAX_FRAMES = 10

  attr_reader :name

  def initialize(name, frame_class = Frame)
    @name = name
    @frame_class = frame_class
    @frames = []
  end

  def add(increase)
    current_frame.add(increase)
  end
  
  def total_score
    score = 0
    for frame_number in 1..MAX_FRAMES do
      score += frame_score(frame_number)
    end
    return score
  end

  def frame_score(number)
    index = number - 1
    @frames[index].nil? ? 0 : @frames[index].score
  end

  def current_frame
    add_new_frame if @frames.empty?
    add_new_frame if @frames.last.complete?
    @frames.last
  end

  def add_new_frame
    @frames << @frame_class.new(next_frame_number)
  end

  def next_frame_number
    return 1 if @frames.empty?
    return @frames.length + 1
  end
end

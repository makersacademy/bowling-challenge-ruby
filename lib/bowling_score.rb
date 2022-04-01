require_relative './frame'

class BowlingScore
  MAX_FRAMES = 10

  attr_reader :name

  def initialize(name, frame_class = Frame)
    @name = name
    @frame_class = frame_class
    @frames = []
  end

  def add(increase)
    add_new_frame if current_frame.complete?
    apply_bonus(increase)
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
    return @frames.last
  end

  def previous_frame
    return nil if @frames.empty?
    previous_number = current_frame.number - 1
    @frames.find { |frame| frame.number == previous_number }
  end

  def apply_bonus(increase)
    if previous_frame.nil?
      return nil
    end
    previous_frame.increase_bonus(increase) unless previous_frame.bonus_complete?
  end

  def add_new_frame
    @frames << @frame_class.new(next_frame_number)
  end

  def next_frame_number
    return 1 if @frames.empty?
    return @frames.length + 1
  end
end

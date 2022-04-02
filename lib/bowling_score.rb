require_relative './frame'

class BowlingScore
  MAX_FRAMES = 10

  attr_reader :name

  def initialize(name, frame_class = Frame)
    @name = name
    @frame_class = frame_class
    @frames = []
  end

  def total_score
    score = 0
    for frame_number in 1..MAX_FRAMES do
      score += frame_score(frame_number)
    end
    return score
  end

  def add(increase)
    raise 'The game is over' if game_complete?

    apply_bonus(increase)
    if @frames.length < MAX_FRAMES
      add_new_frame if current_frame.complete?
    end
    current_frame.add(increase)
  end

  def apply_bonus(increase)
    incomplete_bonuses = @frames.select { |frame| frame.bonus_complete? == false }
    incomplete_bonuses.each { |frame| frame.increase_bonus(increase) }
  end

  def frame_score(number)
    search_frame = @frames.find { |frame| frame.number == number }
    search_frame.nil? ? 0 : search_frame.score
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

  def add_new_frame
    @frames << @frame_class.new(next_frame_number)
  end

  def next_frame_number
    return 1 if @frames.empty?
    return @frames.length + 1
  end

  def game_complete?
    return false if @frames.length < MAX_FRAMES
    @frames.all? do |frame|
      frame.complete? && frame.bonus_complete?
    end
  end
end

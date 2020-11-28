class Game
  attr_reader :running_score

  def initialize
    @frames = []
    @running_score = 0
  end

  def current_frame_number
    @frames.length
  end

  def current_frame_object
    @frames.last
  end

  def new_frame(frame)
    @frames << frame
  end

  def knocked(pins)
    current_frame_object.input_roll_score(pins)
  end

  def update_score
    normal_update if current_frame_number >= 1
    double_update if current_frame_number >= 2
    triple_update if current_frame_number >= 3
    @running_score = 0
    @frames.each do |frame|
      @running_score += frame.total_score
    end
  end

  private
  def normal_update
    current_frame_object.add_score(current_frame_object.pins_knocked)
  end

  def double_update
    if @frames[@frames.length - 2].strike?
      @frames[@frames.length - 2].add_score(current_frame_object.points_for_strike)
    elsif @frames[@frames.length - 2].spare?
      @frames[@frames.length - 2].add_score(current_frame_object.points_for_spare)
    end
  end

  def triple_update
    @frames[@frames.length - 3].add_score(10) if current_frame_object.strike? && @frames[@frames.length - 2].strike? && @frames[@frames.length - 3].strike?
  end
end

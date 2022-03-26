class Frame
  FIRST_FRAME = 1

  attr_reader :frames, :current_frame

  def initialize(current_frame = FIRST_FRAME)
    @frames = (1..10).map { |x| [x, []] }.to_h
    @current_frame = current_frame
  end

  def add_first_roll(first_pin)
    if first_pin == 10
      @frames[@current_frame] = [first_pin, 0]
      next_frame
    else
      @frames[@current_frame] = [first_pin]
    end
  end

  def add_second_roll(second_pin)
    @frames[@current_frame] << second_pin
    next_frame
  end

  def complete?(current_frame)
    @frames[current_frame].count == 2
  end

  def strike?
    @frames[@current_frame - 1][0] == 10
  end

  def spare?
    @frames[@current_frame - 1].sum == 10
  end

  private

  def next_frame
    @current_frame += 1
  end
end

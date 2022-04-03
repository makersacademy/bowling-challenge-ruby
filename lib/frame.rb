class Frame
  FIRST_FRAME = 1
  SECOND_FRAME = 2
  STRIKE = 10
  STRIKE_BONUS = 20

  attr_reader :frames, :current_frame, :next_frame

  def initialize(current_frame = FIRST_FRAME, next_frame = SECOND_FRAME)
    @frames = (1..10).map { |x| [x, []] }.to_h
    @current_frame = current_frame
    @next_frame = next_frame
  end

  def add_first_roll(first_pin) 
    if @current_frame > 1 && strike? 
      if first_pin == STRIKE
        consecutive_strike(first_pin)
      else
        @frames[@current_frame] = [first_pin]
      end
    elsif @current_frame > 1 && spare? 
      if first_pin == STRIKE
        spare_and_strike(first_pin)
      else
        @frames[@current_frame] = [first_pin]
        @frames[@current_frame - 1][1] += first_pin
      end
    else
      if first_pin == STRIKE
      single_strike(first_pin)
      else
        @frames[@current_frame] = [first_pin]
      end
    end
  end

  def add_second_roll(second_pin)
    if @current_frame != @next_frame
      if @current_frame > 1 && strike? 
        @frames[@current_frame] << second_pin
        @frames[@current_frame - 1][1] += @frames[@current_frame].sum
      else
        @frames[@current_frame] << second_pin
      end
    end
    new_next_frame
    new_current_frame
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

  def new_current_frame
    @current_frame += 1
  end

  def new_next_frame
    @next_frame += 1
  end

  def consecutive_strike(first_pin)
    @frames[@current_frame] = [first_pin, 0]
    @frames[@current_frame - 1][1] += STRIKE_BONUS
    new_next_frame
    new_current_frame
  end

  def spare_and_strike(first_pin)
    @frames[@current_frame] = [first_pin, 0]
    @frames[@current_frame - 1][1] += first_pin
    new_next_frame
    new_current_frame
  end

  def single_strike(first_pin)
    @frames[@current_frame] = [first_pin, 0]
    new_next_frame
    new_current_frame
  end

end

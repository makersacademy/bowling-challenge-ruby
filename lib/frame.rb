class Frame

  attr_accessor :current_frame, :frame_total

  def initialize
    @current_frame = 1
    @frame_pins = []
  end

  def single_roll(pins)
    if @current_frame == 10
      final_frame(pins)
    else
      @frame_pins << pins
      if frame_completed?(@frame_pins)
        raise "Score recorded for frame #{@current_frame} is invalid" if illegal_pins?
        return :strike if strike?(@frame_pins)
        return :spare if spare?(@frame_pins)
        return :other
      else
        return :incomplete
      end
    end
  end

  def final_frame(pins)
    @frame_pins << pins
    if final_completed?
      if @frame_pins.length == 2
        return :other
      else
        return :three
      end
    else
      return :incomplete
    end
  end

  def strike?(throws)
    throws.length == 1 && throws.sum == 10
  end

  def spare?(throws)
    throws.length == 2 && throws.sum == 10
  end

  def frame_completed?(throws)
    throws.length == 2 || throws.sum == 10 && legitimate_frame?(throws.sum)
  end

  def final_completed?
    if @frame_pins[0] == 10 && @frame_pins.length == 3
      true
    elsif @frame_pins.length == 3 && @frame_pins[0] + @frame_pins[1] == 10
      true
    elsif @frame_pins.length == 2 && @frame_pins[0] + @frame_pins[1] < 10 
      true
    else
      false
    end
  end

  def legitimate_frame?(score)
    score >=0 && score <=10
  end

  def start_next
    @current_frame += 1
    @frame_pins = []
  end

  def illegal_pins?
    @frame_pins.sum > 10
  end
end

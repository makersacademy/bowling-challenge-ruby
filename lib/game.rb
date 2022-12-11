require_relative "frame"

class Game
  def initialize(frame_class = Frame)
    @frames = []
    10.times { @frames << frame_class.new }

    @frame = 1

    return nil
  end

  def frames
    return @frames
  end

  def add_roll(roll)
    raise "You cannot add any more rolls" if @frame > 10

    current_frame = @frames[@frame - 1]
    current_frame.add_roll(roll)
    @frame += 1 if current_frame.status != :active
  end

  def complete?
    completed = @frames.all? do |frame|
      case frame.status
      when :strike
        frame.rolls == 1
      when :spare
        frame.rolls == 2
      when :done
        frame.rolls == 2
      else
        false
      end
    end
  end
end

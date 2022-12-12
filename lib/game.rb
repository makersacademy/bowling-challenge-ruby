require_relative "frame"

class Game
  def initialize(frame_class = Frame)
    @frames = []
    10.times { @frames << frame_class.new }

    @frame = 1
  end

  def frames
    return @frames
  end

  def add_roll(roll)
    raise "You cannot add any more rolls" if @frame > 10

    current_frame = @frames[@frame - 1]
    current_frame.add_roll(roll)

    frames_to_update = @frames[([0, @frame - 3].max)...(@frame - 1)]
    frames_to_update.each { |frame| frame.add_bonus(roll) }
    
    @frame += 1 if current_frame.status != :active
  end

  def complete?
    completed = @frames.all? do |frame|
      case frame.status
      when :strike
        frame.rolls.length == 1
      when :active
        false
      else
        frame.rolls.length == 2
      end
    end
  end
end

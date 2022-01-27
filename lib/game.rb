require './lib/frame'

class Game

  attr_reader :frames, :current_frame

  def initialize(frames = [])
    @frames = frames
  end

  def total_score
    @frames.sum { |frame| frame.score }
  end

  def add_roll(knocked_pins, frame = Frame.new)
    raise 'round complete' if round_finished?
    assign_bonus_points(knocked_pins)
    fill_or_create_frame(knocked_pins, frame)
  end

  private  

  def fill_or_create_frame(knocked_pins, frame)
    if @frames.empty? || @frames.last.complete? && !tenth_frame?
      add_frame(frame)
      @frames.last.add_roll(knocked_pins)
    elsif !@frames.last.complete?
      @frames.last.add_roll(knocked_pins)  
    end
  end

  def tenth_frame?
    @frames.length == 10
  end

  def assign_bonus_points(points)
    @frames.each do |frame|
      if frame.complete? && frame.bonus_rolls > 0
        frame.add_points(points)
        frame.bonus_rolls -= 1
      end
    end
  end
  
  def add_frame(frame)
    @frames << frame
  end

  def round_finished?
    if @frames.empty?
      false
    else
      @frames.length == 10 && @frames.last.bonus_rolls == 0 && frames.last.complete?
    end
  end
end


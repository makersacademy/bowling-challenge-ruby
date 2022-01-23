require './lib/frame'

class Game

  attr_reader :frames, :current_frame

  def initialize(frames = [])
    @frames = frames
  end

  def total_score
    @frames.sum { |frame| frame.score }
  end

  def add_roll(knocked_pins)
    validate_roll(knocked_pins)
    assign_bonus_points(knocked_pins)
    combine_frame(knocked_pins) unless tenth_frame?
    # uncomment for irb demo
    "Total score: #{total_score}"
  end

  private  

  def tenth_frame?
    @frames.length == 10
  end

  def validate_roll(knocked_pins)
    raise 'round complete' if round_finished?
    raise 'invalid roll' unless valid_roll?(knocked_pins)
  end

  def assign_bonus_points(points)
    @frames.each do |frame|
      if frame.bonus_rolls > 0
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
      @frames.length == 10 && @frames.last.bonus_rolls == 0
    end
  end

  def valid_roll?(knocked_pins)
    if knocked_pins > 10 
      false
    elsif @current_frame 
      @current_frame.first + knocked_pins <= 10 
    else
      true
    end
  end

  def combine_frame(knocked_pins)
    if knocked_pins == 10 
      add_frame(Frame.new(10, nil))
      # uncomment for irb demo
      p "Frame #{frames.length} complete"
    else
      @current_frame ? @current_frame << knocked_pins : @current_frame = [knocked_pins]
      if @current_frame.length == 2
        add_frame(Frame.new(@current_frame.first, @current_frame.last))
        @current_frame = nil
        # uncomment for irb demo
        p "Frame #{frames.length} complete"
      end
    end
  end
end


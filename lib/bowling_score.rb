class BowlingScore
  attr_reader :scorecard, :gamescore, :frame_number, :frame_status

  def initialize
    @scorecard = Array.new(10) { Array.new }
    @frame_number = 1
    @gamescore = 0
    @frame_status = nil
    @roll_number = 1
    @working = Array.new
  end

  def add_pins_to_frame(pins)
    frame_index = @frame_number - 1
    @scorecard[frame_index] << pins
    p @scorecard
  end

  def add_pins_to_working(pins)
    @working << pins
  end

  def add_to_gamescore(pins)
    @gamescore += pins
  end

  def roll(pins)
    if @frame_status == :strike
      frame_status_strike(pins)
    elsif @frame_status == :spare
      frame_status_spare(pins)
    elsif @frame_status.nil?
      frame_status_nil(pins)
    elsif @frame_status == :incomplete
      frame_status_incomplete(pins)
    end
    print_score
  end

  def frame_status_strike(pins)

  end

  def frame_status_spare(pins)
    add_pins_to_working(pins)
    add_pins_to_frame(pins)
    @roll_number = 2
  end

  def frame_status_incomplete(pins)
    add_to_gamescore(pins)
    add_pins_to_frame(pins)
    if @gamescore > 10
      raise "Illegal roll."
    elsif @gamescore == 10
      @frame_status = :spare
      p @frame_status
      increment_frame
    else
      @frame_status = :open
      p @frame_status
      increment_frame
    end
  end

  def frame_status_nil(pins)
    add_to_gamescore(pins)
    add_pins_to_frame(pins)
    if @gamescore == 10
      @frame_status = :strike
      p @frame_status
      increment_frame
    else
      @frame_status = :incomplete
      p @frame_status
    end
  end

  def increment_frame
    @frame_number += 1
    p "Frame: #{@frame_number}"
  end

  def frame_complete?
    @scorecard[@frame_index].length == 2
    #   #   frame_status = :complete
    #   # else
    #   #   frame_status = :incomplete
    #   # end
  end

  def print_score
    p "Your score is #{@gamescore}"
  end
end

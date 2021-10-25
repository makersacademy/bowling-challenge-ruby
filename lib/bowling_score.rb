class BowlingScore
  attr_reader :scorecard, :gamescore, :frame_number, :frame_status

  def initialize
    @scorecard = Array.new(10) { Array.new }
    @frame_number = 1
    @gamescore = 0
    @frame_status = nil
  end

  def capture_pins
    p "Enter pins knocked down"
    pins = gets.chomp.to_i
  end

  # def pins_to_score  
  #   score(pins)
  #   add_pins_to_frame(pins)
  # end

  def add_pins_to_frame(pins)
    @frame_index = @frame_number - 1
    @scorecard[@frame_index] << pins
    p @scorecard
  end

  def score(pins)
    if @frame_status.nil?
      @gamescore += pins
      add_pins_to_frame(pins)
      if @gamescore == 10
        @frame_status = :strike
        increment_frame
      else
        @frame_status = :incomplete
      end
      print_score
    elsif @frame_status == :incomplete
      @gamescore += pins
      add_pins_to_frame(pins)
      if @gamescore > 10
        raise "Illegal roll."
      end
      if @gamescore == 10
        @frame_status = :spare
        increment_frame
      else
        @frame_status = :open
        increment_frame
      end
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
    p "Your score is #{@score}"
  end

end

require './lib/frames'

class Roll
  # do you need these attr_readers???
  attr_reader :first_roll, :frame_number, :pins_knocked, :score_count, :this_frame_count, :strike_count, :bonus, :roll_again

  def initialize(score_count:, strike_count:, first_roll:, this_frame_count: )
    @first_roll = first_roll
    @this_frame_count = this_frame_count
    @score_count = score_count
    @strike_count = strike_count
    @bonus = nil
  end

  def scoring(pins)
    @pins_knocked = pins
    @score_count += @pins_knocked
    @this_frame_count += @pins_knocked
  end

  def strike_or_spare
     if @pins_knocked == 10
      @strike_count += 1
      @bonus = 'strike'
     elsif @this_frame_count == 10
      @bonus = 'spare'
     end
  end

  def next_roll?
    if (@bonus == nil) && (@first_roll == true)
      @first_roll = false
      @roll_again = true
    else
      @roll_again = false
    end
  end

end
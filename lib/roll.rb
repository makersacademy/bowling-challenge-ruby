require './lib/frames'

class Roll
  # do you need these attr_readers???
  attr_reader :first_roll, :frame_number, :pins_knocked, :score_count, :this_frame_count, :strike_count, :bonus

  def initialize(round: , score_count:, strike_count:)
    @first_roll = true
    @this_frame_count = 0
    @round = round
    @score_count = score_count
    @strike_count = strike_count
    @bonus = nil
    receive_next_score
  end

  def scoring(pins)
    @pins_knocked = pins
    @score_count += @pins_knocked
    @this_frame_count += @pins_knocked
  end

  def strike_or_spare
     if @pins_knocked == 10
      @bonus = 'strike'
      @strike_count += 1
     elsif @this_frame_count == 10
      @bonus = 'spare'
     end
  end

  def next_roll?
    if (@bonus == nil) && (@first_roll == true)
      @first_roll = false
      receive_next_score
    else
      end_roll
    end
  end

  def receive_next_score
    #receives number of pins from Frames??? and ccalls scoring(pins)
  end
  

  def end_roll
    Frames.new_round(round: @round, score_count: @score_count, strike_count: @strike_count, bonus: @bonus)
  end


end
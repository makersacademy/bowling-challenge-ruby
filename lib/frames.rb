class Frames
  def initialize
    @frame = 0
    @bonus = 0
  end

  def increment_frame # Not in use anymore
    @frame += 1
  end

  def current_frame # Not in use anymore
    @frame
  end

  def roll_1(pins_knocked_down_r1)
    # pins knocked down from user (values are 0 to max 10)
    if pins_knocked_down_r1 <= 10 && pins_knocked_down_r1 > 0
      return pins_knocked_down_r1.to_i
    else
      fail "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
    end
  end

  def roll_2(pins_knocked_down_r2)
    # pins knocked down from user (values are 0 to max 10)
    if pins_knocked_down_r2 <= 10 and pins_knocked_down_r2 > 0
      return pins_knocked_down_r2.to_i
    else
      fail "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
    end
  end

  def bonus(current_frame)
    # Roll_1 + Roll_2 cannot be larger than 10
     # calculates the bonus based on the next frame rolls (F+1 R1 and R2)
    if @pins_knocked_down_r1 + @pins_knocked_down_r2 > 10
        fail "Rolls are incorrect!"
    else
        if @pins_knocked_down_r1 == 10
            puts "Strike!"
           return @bonus = @pins_knocked_down_r1 + @pins_knocked_down_r2
        else
           return @bonus = @pins_knocked_down_r1
        end
    end
  end
end

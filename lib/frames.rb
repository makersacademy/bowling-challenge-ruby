class Frames
  def initialize
    @frame = 0
  end

  def increment_frame
    @frame += 1
  end

  def current_frame
    @frame
  end

  def roll_1(pins_knocked_down)
    # pins knocked down from user (values are 0 to max 10)
    if pins_knocked_down <= 10 and pins_knocked_down > 0
      return pins_knocked_down.to_i
    else
        puts "Roll is incorrect. It must be a value between 0 and 10 (inclusive)"
    end
  end

  #def roll_2(roll)
    # puts "Roll the ball - roll 2"
    # gets.chomp pins knocked down from user (values are 0 to max 10)
    # pins_knocked - gets.chomp
    # returns int (pins)
  #end

  #def bonus(player, current_frame)
    # calculates the bonus based on the next frame rolls (F+1 R1 and R2)
  #end

  #def accumulated_score(player)
    # calculates the accumulated score
  #end
end

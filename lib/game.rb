class Game

  attr_reader :scorecard, :frames_total, :roll_counter, :frame_counter, :spare, :strike
  def initialize
    @scorecard = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @frames_total = [0,0,0,0,0,0,0,0,0,0]
    @roll_counter = 1
    @frame_counter = 1
    @spare = false
    @strike = false
  end

  def roll(score)
    if @roll_counter.odd?
      case score
      when 10
        @roll_counter += 2
        mark_roll_score(score)
        add_score_to_frame(score)
        @frame_counter += 1
        @spare = false
        @strike = true
      when 0..9
        mark_roll_score(score)
        @roll_counter += 1
        add_score_to_frame(score)
        @spare = false
      end
    else
      if @frames_total[@frame_counter - 1] + score == 10
        mark_roll_score(score)
        @roll_counter += 1
        add_score_to_frame(score)
        @frame_counter += 1
        @spare = true
        @strike = false
      else
        mark_roll_score(score)
        @roll_counter += 1
        add_score_to_frame(score)
        @frame_counter += 1
        @strike = false
      end
    end
  end


  private

  def mark_roll_score(score)
    @scorecard[@roll_counter - 1] += score
  end
  def add_score_to_frame(score)
    @frames_total[@frame_counter - 1] += score
  end
end


# def bowling
#   p "what was roll_one?"
#   roll_one = gets.chomp
#   p roll_one
#   if roll_one == 10
#     @strike = true
#     @frame << roll_one
#     @frame << 0
#     @frame.sum
#   else
#     @frame << roll_one
#     p "what was roll two?"
#     roll_two = gets.chomp
#     if (roll_two + roll_one) == 10
#       @frame << roll_two
#       @spare = true
#       @frame.sum
#     else
#       @frame << roll_two
#       @frame.sum
#     end
#   end
# end
# end
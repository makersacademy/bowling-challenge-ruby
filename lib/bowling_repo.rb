require 'frame_repo'

class Scorecard
  def initialize 
    @total_score = 0
    @frame = 0
  end

  def add_score(roll_one, roll_two)
    if @frame < 10
      @total_score += roll_one + roll_two
      @frame += 1
    end
  end

  def total_score
    @total_score
  end
end

#   def strike_or_spare
#       if roll_one != 10 && (roll_one + roll_two == 10)
#       total_score += frame -1
#       spare_points == true
#     elsif roll_one == 0
#       strike_points == true
#     end
#   end

#   def final_score_comment(total_score)
#     if @total_score == 300
#       return "Perfect score!"
#     elsif @total_score == 0
#       return "Gutter Ball!"
#     else
#       return "Final score is: #{total_score}"
#     end
# end
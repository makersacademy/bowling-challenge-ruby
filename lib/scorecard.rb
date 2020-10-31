class Scorecard

attr_reader :score

  def initialize(team)
    @team = team
    @score = scorecard
  end

  def scorecard
    {@team => {} }
  end

  def reset_scorecard
    @score[@team].clear
  end

  def add_roll(turn, pins)
    @score[@team][turn] = pins
  end

  def strike?(input1, input2)
    input1 == 10 || input2 == 10
  end

  def spare?(input1, input2)
    input1 + input2 == 10 && (input1 != 0 || input2 != 0)
  end

  def next_frame_nil?(input1, input2)
    input1 == nil || input2 == nil
  end

  def sum_a_frame(next_roll_1, next_roll_2)
    next_roll_1 + next_roll_2
  end

  def total(frame)
    score = 0
    while frame > 0 do
      this_frame_roll1, this_frame_roll2 = @score[@team][frame+0.1], @score[@team][frame+0.2]
      next_frame_roll1, next_frame_roll2 = @score[@team][frame+1.1], @score[@team][frame+1.2]
      score += sum_a_frame(this_frame_roll1, this_frame_roll2)
        if strike?(this_frame_roll1, this_frame_roll2)
          unless next_frame_nil?(next_frame_roll1, next_frame_roll2)
            score += sum_a_frame(next_frame_roll1, next_frame_roll2)
          end
        elsif
          spare?(this_frame_roll1, this_frame_roll2)
          unless next_frame_roll1 == nil
            score += next_frame_roll1
          end
        end
        frame -= 1
    end
    score
  end

end

class Bowling

  def initialize
    @score = []
    @frame_no = 1 # game ends when frame_no = 11
    @strike = false
    @spare = false
  end

  def frame(roll_1, roll_2) # roll_1 and roll_2 are integers 
                            # entered by player.
    if @strike == true
      roll_1 = (roll_1 * 2)
      roll_2 = (roll_2 * 2)
      @strike = false
    end
    if @spare == true
      roll_1 = (roll_1 * 2)
      @spare = false
    end
    if roll_1 == 10
      @strike = true
    end
    if roll_1 + roll_2 == 10 && roll_1 < 10
      @spare = true
    end
    frame_score = roll_1 + roll_2
    # frame_score gets added to total score array
    @score << frame_score
    @frame_no += 1
  end

  def score_so_far
    @score.sum
  end

  def frame_no
    @frame_no
  end
end
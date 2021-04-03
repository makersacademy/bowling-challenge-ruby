require_relative 'scorecard'

class BowlingGame

  attr_reader :current_frame, :strike, :spare, :scorecard

  def initialize
    @current_frame = 1
    @strike = false
    @spare = false
    @scorecard = Scorecard.new
  end

  def roll_1(players_score)
    if @strike
      update_bonus(players_score)
    elsif @spare
      update_bonus(players_score)
    end

    if players_score < 10 && @current_frame == 10
      update_roll_1_score(players_score)
      update_roll_2_score(0)
      update_roll_3_score(0)
      update_scorecard
    elsif players_score == 10 && @current_frame < 10
      update_roll_1_score(players_score)
      update_roll_2_score(0)
      update_scorecard
      @strike = true
      "Strike!"
    else
      update_roll_1_score(players_score)
      "Nice roll! Let's Roll again!"
    end
  end

  def roll_2(players_score)
    update_roll_2_score(players_score)

    if @current_frame == 10
      update_roll_2_score(players_score)
    elsif @strike
      update_bonus(players_score)
      update_scorecard
      @strike = false
    elsif @spare
      update_scorecard
      @spare = false
    elsif @strike == false && @spare == false
      update_roll_2_score(players_score)
      update_scorecard
    end

    if @scorecard.roll_1_score + players_score == 10
      @spare = true
      return "Spare!"
    end
  "Great Job! That's the end of this frame"

  end


  def roll_3(players_score)
    if @current_frame < 10
      return "You can only roll a third time in the 10th frame"
    end

    update_roll_3_score(players_score)
    if @strike
      update_scorecard
    elsif @spare
      update_scorecard
    else
      update_scorecard
    end

  end

  def next_frame
    if @current_frame < 10
      @current_frame += 1
    else
    end_of_game
    end
  end

  def update_roll_1_score(players_score)
    @scorecard.roll_1_score = players_score
  end

  def update_roll_2_score(players_score)
    @scorecard.roll_2_score = 0
  end

  def update_roll_3_score(players_score)
    @scorecard.roll_3_score = 0
  end

  def update_bonus(players_score)
    @scorecard.update_bonus(players_score)
  end


  def update_scorecard
    @scorecard.update_scorecard(@current_frame, @strike, @spare)
    next_frame
  end

 def view_scorecard
   @scorecard.scorecard
 end

 def end_of_game
   "End of game"
 end

end

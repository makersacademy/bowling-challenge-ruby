class BowlingGame

  attr_reader :current_frame, :roll_1_score, :roll_2_score, :roll_3_score, :bonus_score, :total_frame_score, :strike, :spare, :scorecard

  def initialize
    @current_frame = 1
    @roll_1_score = 0
    @roll_2_score = 0
    @roll_3_score = nil
    @bonus_score = 0
    @total_frame_score = 0
    @strike = false
    @spare = false
    @scorecard = []
  end

  def roll_1(players_score)
    if @strike
      @bonus_score = players_score
    elsif @spare
      @bonus_score = players_score
    end

    if players_score < 10 && @current_frame == 10
      @roll_1_score = players_score
      @roll_2_score = 0
      @roll_3_score = 0
      update_scorecard
    elsif players_score == 10 && @current_frame < 10
      @strike = true
      @roll_1_score = players_score
      @roll_2_score = 0
      update_scorecard
    else
      @roll_1_score = players_score
    end
  end

  def roll_2(players_score)
    @roll_2_score = players_score

    if @current_frame == 10
      @roll_2_score = players_score
    elsif @strike
      @bonus_score += players_score
      update_scorecard_if_strike
    elsif @spare
      update_scorecard_if_spare
    elsif (@strike == false && @spare == false)
      update_scorecard
    end

    if @roll_1_score + players_score == 10
      @spare = true
    end
  end


  def roll_3(players_score)
    @roll_3_score = players_score
    if @strike
      update_scorecard_if_strike
    elsif @spare
      update_scorecard_if_spare
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

  def update_scorecard
    @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :roll_3 => @roll_3_score, :bonus_score => @bonus_score }}
    next_frame
  end

  def update_scorecard_if_spare
    if @current_frame == 10
      @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @roll_1_score
    else
    @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @bonus_score
    end

    @spare = false
    @bonus_score = 0

    @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :roll_3 => @roll_3_score, :bonus_score => @bonus_score }}
    next_frame
  end

 def update_scorecard_if_strike
   if @current_frame == 10
     @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @roll_1_score + @roll_2_score
   else
     @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @bonus_score
   end

   @strike = false
   @bonus_score = 0

   @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :roll_3 => @roll_3_score, :bonus_score => @bonus_score }}
   next_frame
 end

 def end_of_game
   "End of game"
 end

end

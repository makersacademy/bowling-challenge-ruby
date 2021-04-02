class BowlingGame

  attr_reader :current_frame, :roll_1_score, :roll_2_score, :roll_3_score, :bonus_score, :total_frame_score, :strike, :spare, :scorecard

  def initialize
    @current_frame = 1
    @roll_1_score = 0
    @roll_2_score = 0
    @roll_3_score = 0
    @bonus_score = 0
    @total_frame_score = 0
    @strike = false
    @spare = false
    @scorecard = []
  end

  def roll_1(players_score)
    @roll_1_score = players_score
    if players_score == 10
      @strike = true
    end

    if @strike
      @bonus_score = players_score
    elsif @spare
      @bonus_score = players_score
    end
  end

  def roll_2(players_score)
    if @roll_1_score + players_score == 10
      @spare = true
    end

    if @strike
      @bonus_score += players_score
    end

    @roll_2_score = players_score
  end

  def roll_3(players_score)
    @roll_3_score = players_score
  end

  def next_frame
    @current_frame += 1
  end

  def update_scorecard

    @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :bonus_score => @bonus_score }}
    next_frame
  end

  def update_scorecard_if_spare
    if @spare
      @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @bonus_score
    end

    @spare = false
    @bonus_score = 0
    @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :bonus_score => @bonus_score }}
  end

 def update_scorecard_if_strike
   if @strike
     @scorecard[@current_frame-2]["frame_#{@current_frame-1}"][:bonus_score] = @bonus_score
   end

   @strike = false
   @bonus_score = 0
   @scorecard << { "frame_#{@current_frame}" => { :roll_1 => @roll_1_score, :roll_2 => @roll_2_score, :bonus_score => @bonus_score }}
 end

end

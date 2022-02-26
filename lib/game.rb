class Game

  # attr_reader :scorecard, :frames_total, :roll_counter, :frame_counter, :spare, :strike, :bonus

  # def initialize
  #   @scorecard = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  #   @frames_total = [0,0,0,0,0,0,0,0,0,0]
  #   @roll_counter = 1
  #   @frame_counter = 1
  #   @spare = false
  #   @strike = false
  #   @bonus = 0
  # end

  def roll(score)

  #  if tenth_frame_is_spare
  #   spare_finale(score)
  #  end
  #  if tenth_frame_is_strike_first_go
  #   @strike = false
  #   mark_roll_score(score)
  #   add_score_to_frame(score)
  #   return next_roll
  #  end
  #  if tenth_frame_is_strike_second_go
  #   mark_roll_score(score)
  #   return add_score_to_frame(score)
  #  end
      
  #   spare_bonus(score)
  #   strike_bonus(score)
    if first_roll_of_frame
     score == 10 ? its_a_strike(score) : normal_first_role(score)
    else frame_total(score) == 10 ? its_a_spare(score) : normal_second_role(score)
    end
    p @frames_total
    p @frames_total.sum
    return "Great game, you scored #{@frames_total.sum + @bonus}" if tenth_frame_is_normal
  end
  def grand_total
    @frames_total.sum + @bonus
  end

  private

  def first_roll_of_frame
    @roll_counter.odd?
  end

  def frame_total(score)
    @frames_total[@frame_counter - 1] + score
  end

  def mark_roll_score(score)
    @scorecard[@roll_counter - 1] += score
  end
  def add_score_to_frame(score)
    @frames_total[@frame_counter - 1] += score
  end
  def end_of_frame
    @frame_counter += 1
  end
  def next_roll
    @roll_counter += 1
  end
  def its_a_strike(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    next_roll
    end_of_frame
    @spare = false
    @strike = true
  end

  def normal_first_role(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    @spare = false
  end

  def its_a_spare(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
    @spare = true
    @strike = false
    "spare!"
  end

  def normal_second_role(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
    @strike = false
  end

  def strike_bonus(score)
    add_score_to_bonus(score) if @strike == true && @scorecard[@roll_counter - 3] == 10 && score == 10
    add_score_to_bonus(score) if @strike == true
  end

  def spare_bonus(score)
    add_score_to_bonus(score) if @spare == true
  end

  def add_score_to_previous_frame_total(score)
    @frames_total[@frame_counter - 2] += score 
  end

  def tenth_frame_is_normal
    @roll_counter == 21 && @strike == false && @spare == false
  end

  def tenth_frame_is_spare
    @roll_counter == 21 && @strike == false && @spare == true 
  end

  def tenth_frame_is_strike_first_go
    @roll_counter == 21 && @strike == true && @spare == false 
  end
  def tenth_frame_is_strike_second_go
    @roll_counter == 22 && @strike == true && spare == false
  end

  def spare_finale(score)
    p "roll_counter #{@roll_counter}"
    mark_roll_score(score)
    
    add_score_to_frame(score)
    p "frame_total #{@frames_total[10]}"
    
   add_score_to_previous_frame_total(score)
    p @scorecard
    p @frames_total
  end

  def end_game(score)
    if tenth_frame_is_spare
      mark_roll_score(score)
      add_score_to_frame(score)
      add_score_to_previous_frame_total(score)
      return "Great game, you scored #{@frames_total.sum}"
     end
     if tenth_frame_is_strike_first_go
      @strike = false
      mark_roll_score(score)
      add_score_to_frame(score)
      p "tenth frame total: #{@frames_total[10]}"
      return next_roll
     end
     if tenth_frame_is_strike_second_go
      mark_roll_score(score)
      add_score_to_frame(score)
      p "tenth frame total: #{@frames_total[10]}"
      p @scorecard
      return "Great game, you scored #{grand_total}"
     end
  end

  def add_score_to_bonus(score)
    @bonus[@frame_counter - 2] += score
  end
  
  

end
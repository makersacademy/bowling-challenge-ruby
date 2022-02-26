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
    spare_bonus(score)
    strike_bonus(score)
    if first_roll_of_frame
     score == 10 ? its_a_strike(score) : normal_first_role(score)
    else
      frame_total(score) == 10 ? its_a_spare(score) : normal_second_role(score)
    end
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
  end

  def normal_second_role(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
    @strike = false
  end

  def strike_bonus(score)
    @frames_total[@frame_counter - 2] += score if @strike == true
  end

  def spare_bonus(score)
    @frames_total[@frame_counter - 2] += score if @spare == true
  end

end
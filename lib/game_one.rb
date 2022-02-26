# frozen_string_literal: true

class GameOne
  
  attr_reader :scorecard, :frames_total, :roll_counter, :frame_counter, :spare, :strike, :bonus, :double_strike,
              :game_total

  def initialize
    @scorecard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @frames_total = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @bonus = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @roll_counter = 1
    @frame_counter = 1
    @spare = false
    @strike = false
    @double_strike = false
    @game_total = 0
  end

  def roll(score)
    return spare_finale(score) if tenth_frame_is_spare
    return tenth_frame_first_roll(score) if tenth_frame_is_strike_first_go

    tenth_frame_second_roll(score) if tenth_frame_is_strike_second_go
    return tenth_frame_third_roll(score) if tenth_frame_is_strike_third_go

    bonus_points(score)
    normal_frames(score)
    total
  end

  private

  # normal behaviour when frame is 1..9
  def normal_frames(score)
    if first_roll_of_frame
      score == 10 ? its_a_strike(score) : normal_first_roll(score)
    else
      frame_total(score) == 10 ? its_a_spare(score) : normal_second_role(score)
    end
  end

  # common methods that have been renamed and occur each roll
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

  def first_roll_of_frame
    @roll_counter.odd?
  end

  def total
    @game_total = @frames_total.sum + @bonus.sum
  end

  # methods grouped together by different potential role scenarios
  # a strike
  def its_a_strike(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    2.times{ next_roll }
    end_of_frame
    @double_strike = true if @strike == true
    @spare = false
    @strike = true
  end

  # normal first_roll
  def normal_first_roll(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    @spare = false
    @double_strike = false
  end

  # spare on second roll
  def its_a_spare(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
    @spare = true
    @strike = false
  end

  # normal second roll
  def normal_second_role(score)
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
    @strike = false
  end

  #  methods extracted that provide functionality for bonuses
  def bonus_points(score)
    double_strike_bonus(score)
    strike_bonus(score)
    spare_bonus(score)
  end

  def add_score_to_bonus(score)
    @bonus[@frame_counter - 2] += score
  end

  def spare_bonus(score)
    add_score_to_bonus(score) if @spare == true
  end

  def strike_bonus(score)
    add_score_to_bonus(score) if @strike == true
  end

  def double_strike_bonus(score)
    add_score_to_bonus(score) if @double_strike == true
  end

  # last frame is a spare
  def tenth_frame_is_spare
    (@scorecard[18] + @scorecard[19]) == 10 && @scorecard[19] != 0
  end

  def spare_finale(score)
    mark_roll_score(score)
    @frames_total[@frame_counter - 2] += score
    total
  end

  # last frame is a strike
  def tenth_frame_is_strike_first_go
    @scorecard[18] == 10 && @roll_counter == 20
  end

  def tenth_frame_first_roll(score)
    mark_roll_score(score)
    @bonus[@frame_counter - 3] += score
    add_score_to_frame(score)
    next_roll
  end

  def tenth_frame_is_strike_second_go
    @scorecard[18] == 10 && @roll_counter == 21
  end

  def tenth_frame_second_roll(score)
    @scorecard[@roll_counter - 2] += score
    @frames_total[@frame_counter - 2] += score
    end_of_frame
    next_roll
  end

  def tenth_frame_is_strike_third_go
    @scorecard[18] == 10 && @roll_counter == 22
  end

  def tenth_frame_third_roll(score)
    @scorecard[@roll_counter - 2] += score
    @frames_total[@frame_counter - 3] += score
    total
  end
end

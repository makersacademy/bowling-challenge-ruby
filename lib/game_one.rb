# frozen_string_literal: true

class GameOne
  attr_reader :scorecard, :frames_total, :roll_counter,
              :frame_counter, :bonus, :total

  def initialize
    @scorecard = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @frames_total = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @bonus = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @roll_counter = 1
    @frame_counter = 1
    @total
  end

  def roll(score)
    return spare_finale(score) if tenth_frame_is_spare
    return tenth_frame_first_roll(score) if tenth_frame_is_strike_first_go

    tenth_frame_second_roll(score) if tenth_frame_is_strike_second_go
    return tenth_frame_third_roll(score) if tenth_frame_is_strike_third_go

    normal_frames(score)
    total
  end

  def total
    @frames_total.sum + @bonus.sum
  end

  private

  # normal behaviour when frame is 1..9
  def normal_frames(score)
    if first_roll_of_frame
      strike(score) ? its_a_strike(score) : normal_first_roll(score)
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

  def strike(score)
    score == 10
  end

  def next_roll
    @roll_counter += 1
  end

  def first_roll_of_frame
    @roll_counter.odd?
  end

  # methods grouped together by different potential role scenarios
  # a strike
  def its_a_strike(score)
    add_score_to_previous_bonus(score) if last_but_one_frame_was_a_strike
    add_score_to_bonus(score) if previous_frame_strike
    add_score_to_bonus(score) if is_a_spare && @scorecard[@roll_counter - 2] != 0
    mark_roll_score(score)
    add_score_to_frame(score)
    2.times { next_roll }
    end_of_frame
  end

  # normal first_roll
  def normal_first_roll(score)
    add_score_to_previous_bonus(score) if last_but_one_frame_was_a_strike && previous_frame_strike
    add_score_to_bonus(score) if is_a_spare && !previous_frame_strike
    add_score_to_bonus(score) if previous_frame_strike
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
  end

  # spare on second roll
  def its_a_spare(score)
    add_score_to_bonus(score) if last_frame_was_a_strike
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
  end

  # normal second roll
  def normal_second_role(score)
    add_score_to_bonus(score) if last_frame_was_a_strike
    mark_roll_score(score)
    add_score_to_frame(score)
    next_roll
    end_of_frame
  end

  #  methods extracted that provide functionality for bonuses
  def is_a_spare
    (@scorecard[@roll_counter - 3] + @scorecard[@roll_counter - 2]) == 10
  end

  def previous_frame_strike
    @scorecard[@roll_counter - 3] == 10
  end

  def last_but_one_frame_was_a_strike
    @scorecard[@roll_counter - 5] == 10
  end

  def add_score_to_previous_bonus(score)
    @bonus[@frame_counter - 3] += score
  end

  def last_frame_was_a_strike
    @scorecard[@roll_counter - 4] == 10
  end

  def add_score_to_bonus(score)
    @bonus[@frame_counter - 2] += score
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
    add_score_to_previous_bonus(score)
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

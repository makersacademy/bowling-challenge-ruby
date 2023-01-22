# frozen_string_literal: true

class Frame
  attr_accessor :frame_scores, :current_frame
  def initialize
    # {count:1, frame_type:"", final_score:"",bonus:"" ,rolls_taken:{:roll_1,:roll_2},}
    @frame_scores = []
    @current_frame = {frame_number:1, frame_type:"", final_score:0,bonus:0, hit_type:"" ,rolls_taken:{roll_1:Class,roll_2:Class}}
  end
  def calculate_bonus

  end

  def next_frame

  end
  def total_frame_score
    if   previous_frame[":rolls_taken"][":roll_1"].hit_type == "Strike" || previous_frame[":rolls_taken"][":roll_2"].hit_type == "Spare"

    end

      F(n-1)R1 + F(n-1)R2 + 2(F(n)R1)

  end
  private
  def previous_frame
    @frame_scores.filter{|frames| frames.frame_number == (@current_frame - 1)}
  end

  def previous_frame_bonus_calculator
    current_frame_number = @current_frame[:frame_number]
    previous_frame_number = current_frame_number - 1
    previous_frame_hit_type = @frame_scores[current_frame_number][:hit_type]
    current_frame_score = @frame_scores[current_frame_number][:rolls_taken][:roll_1].pins_hit + @frame_scores[current_frame_number][:rolls_taken][:roll_2].pins_hit
    if previous_frame.roll_1.hit_type == "Strike"
      bonus = @current_frame[":rolls_taken"][":roll_1"].pins_hit + @current_frame[":rolls_taken"][":roll_2"].pins_hit

      previous_frame_hits = @frame_scores[previous_frame_number]
      @frame_scores[previous_frame_number][":bonus"] = bonus
      @frame_scores[0][:final_score] = @frame_scores[1][:rolls_taken][:roll_1].pins_hit + @frame_scores[1][:rolls_taken][:roll_2].pins_hit + @frame_scores[0][:rolls_taken][:roll_1].pins_hit
    end
    if previous_frame.roll_1.hit_type == "Spare"
      bonus = @current_frame.roll_1.pins_hit
    end
  end




end

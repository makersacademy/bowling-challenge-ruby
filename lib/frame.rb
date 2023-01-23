# frozen_string_literal: true
require_relative './roll'
class Frame
  attr_reader :current_frame
  def initialize
    # {count:1, frame_type:"", final_score:"",bonus:"" ,rolls_taken:{:roll_1,:roll_2},}
    @current_frame = { frame_number:1, frame_type:"", final_score:0, bonus:0, frame_score:0, rolls_tally:{}}
  end
  def play_frame(first_roll_input,second_roll_input)
    first_roll(first_roll_input)
    second_roll(second_roll_input)
    end_frame
  end



  def first_roll(roll_1_input)
    process_roll(Roll.new(roll_1_input,1))
    if roll_1_input == 10 && @current_frame[:frame_number] < 10
      end_frame
    end
  end
  def second_roll(roll_2_input)
    process_roll(Roll.new(roll_2_input,1))
  end

  def process_roll(roll)
    roll_count = @current_frame[:rolls_tally].keys.length + 1
    @current_frame[:rolls_tally]["roll_#{roll_count}".to_sym] = roll
    adds_pins_hit_to_sum(roll)
  end
  def adds_pins_hit_to_sum(roll)
    @current_frame[:frame_score] =+ roll.pins_hit
  end
  def end_frame
    @current_frame
  end
  def iterate_frame
    @current_frame[:frame_number] += 1
  end
  end





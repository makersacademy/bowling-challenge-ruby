# frozen_string_literal: true
require_relative './frame'
class BowlingScorecard
  attr_reader :frame_scores, :current_frame
  def initialize
    # {count:1, frame_type:"", final_score:"",bonus:"" ,rolls_taken:{:roll_1,:roll_2},}
    @frame_scores = []

  end
  def start_game
    numbers = [1,2,3,4,5,6,7,8,9,10]
    numbers.map.with_index do |n,index|
      game = Frame.new
      @current_frame = game.play_frame(rand(1..5),rand(1..5))
      @frame_scores << calculator_frame_scores(game)
    end
    # return @frame_scores
  end
  def calculator_frame_scores(game)
    calculate_frame_score
    calculate_previous_frame_bonus
    calculate_previous_final_score
    game.iterate_frame
    @current_frame
  end


  def calculate_frame_score(roll_1_pins_hit,roll_2_pins_hit)
    frame_score = roll_1_pins_hit + roll_2_pins_hit
  end

  def calculate_previous_frame_bonus(previous_frame,frame_number,roll_1_pins_hit,roll_2_pins_hit,previous_frame_hit_type_roll_1,previous_frame_hit_type_roll_2)
    if frame_number > 1
      roll_1_score_bonus = %w[Strike].include?(previous_frame_hit_type_roll_1) ? roll_1_pins_hit : 0
      roll_2_score_bonus = %w[Spare Strike].include?(previous_frame_hit_type_roll_2) ? roll_2_pins_hit: 0
      @frame_scores[previous_frame][:bonus] = roll_1_score_bonus + roll_2_score_bonus
    end
  end

  def calculate_previous_final_score(current_frame_number,previous_frame_number,previous_frame_score,previous_frame_bonus)
    if current_frame_number > 1
    @frame_scores[previous_frame_number][:final_score] = previous_frame_score + previous_frame_bonus
    end
  end
  end

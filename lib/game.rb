require_relative 'frame'
require_relative 'final_frame'


class Game
  attr_reader :current_frame_obj, :current_frame_num, :all_frames, :total_scores
  def initialize
    @current_frame_obj
    @current_frame_num
    @all_frames = []
    @total_scores = [0,0,0,0,0,0,0,0,0,0]
  end

  def start_game
    @current_frame_num = 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def first_roll_input
    puts 'How many pins did the first roll knock over?'
    gets.chomp.to_i
  end

  def second_roll_input
    puts 'How many pins did the second roll knock over?'
    gets.chomp.to_i
  end
  
  def first_roll(pins: first_roll_input)
    @current_frame_obj.first_roll(pins: pins)
  end

  def second_roll(pins: second_roll_input)
    @current_frame_obj.second_roll(pins: pins)
  end

  def end_frame
    store_frame
    check_if_end
    return if @finished
    puts "That's the end of Frame #{@current_frame_num}, you scored #{@current_frame_obj.calculate_score}, your total score is #{total_score}"
    next_frame
  end

  def store_frame
    @all_frames << @current_frame_obj
    @current_frame_obj.calculate_score
    calc_total_score
  end

  def check_if_end
    end_game if (@current_frame_num == 10 && @current_frame_obj.score.strike == false && @current_frame_obj.score.spare == false)
    bonus_roll if @current_frame_num == 10 && (@current_frame_obj.score.strike == true || @current_frame_obj.score.spare == true )  
  end

  def next_frame
    @current_frame_num += 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def calc_total_score
    @total_scores[@current_frame_num - 1] = @current_frame_obj.frame_score
    calc_spare
    calc_strike
  end

  def calc_spare
    if all_frames[@current_frame_num - 2].score.spare == true && @current_frame_num > 1
      @total_scores[@current_frame_num - 2] += (10 + (@current_frame_obj.score.first_roll_pins))
    end
  end

  def calc_strike
    if all_frames[@current_frame_num - 2].score.strike == true && @current_frame_num > 1
      @total_scores[@current_frame_num - 2] += (10 + (@current_frame_obj.frame_score))
    end
  end

  def end_game
    @finished = true
    if @current_frame_num == 10
      puts 'Game over! Your total score is:'
    end
  end

  def total_score
    @total_scores.sum
  end

  def bonus_roll
    final_frame
    if all_frames[9].score.spare == true
      bonus_spare
    elsif all_frames[9].score.strike == true
      bonus_strike
    end
  end

  def final_frame
    @current_frame_num = 11
    @current_frame_obj = FinalFrame.new(round: @current_frame_num)
  end

  def bonus_spare
    @total_scores[9] = 10
    @total_scores.append(first_roll_input)
  end

  def bonus_strike
    @total_scores[9] = 10
    @total_scores.append(first_roll_input + second_roll_input)
  end
end

#if previous frame was spare, then change the frame score to doible pluss my first roll
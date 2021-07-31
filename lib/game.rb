require_relative 'frame'

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
    @current_frame_obj.calculate_score
    store_frame
    return if check_if_end
    puts "That's the end of Frame #{@current_frame_num}, you scored #{@current_frame_obj.calculate_score}, your total score is #{total_score}"
    next_frame
  end

  def store_frame
    @all_frames << @current_frame_obj
    @current_frame_obj.calculate_score
    calc_total_score
  end

  def check_if_end
    end_game if @current_frame_num == 10
    @current_frame_num == 10
  end

  def next_frame
    @current_frame_num += 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def calc_total_score
    @total_scores[@current_frame_num - 1] = @current_frame_obj.frame_score
    calc_spare
  end

  def calc_spare
    if all_frames[@current_frame_num - 2].score.spare == true && @current_frame_num > 1
      @total_scores[@current_frame_num - 2] += (10 + (@current_frame_obj.score.first_roll_pins))
    end
  end

  def end_game
    puts 'Game over! Your total score is:'
  end

  def total_score
    @total_scores.sum
  end
end

#if previous frame was spare, then change the frame score to doible pluss my first roll
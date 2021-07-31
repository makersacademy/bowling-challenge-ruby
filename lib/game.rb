require_relative 'frame'

class Game
  attr_reader :current_frame_obj, :current_frame_num, :all_frames
  def initialize
    @current_frame_obj
    @current_frame_num
    @all_frames = []
    @total_score
  end

  def start_game
    @current_frame_num = 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def first_roll_input
    puts 'How many pins did the first roll knock over?'
    gets.chomp
  end

  def second_roll_input
    puts 'How many pins did the second roll knock over?'
    gets.chomp
  end

  def first_roll(pins: first_roll_input)
    @current_frame_obj.first_roll(pins: pins)
  end

  def second_roll(pins: second_roll_input)
    @current_frame_obj.second_roll(pins: pins)
  end

  def end_frame
    store_frame
    return if check_if_end
    puts "That's the end of Frame #{@current_frame_num}, you scored #{current_frame_obj.calculate_score}, your total score is #{total_score}"
    next_frame
  end

  def store_frame
    @current_frame_obj.calculate_score
    @all_frames << @current_frame_obj
  end

  def check_if_end
    end_game if @current_frame_num == 10
    @current_frame_num == 10
  end

  def next_frame
    @current_frame_num += 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def total_score
    @total_score = 0
    all_frames.each { |frame| @total_score += frame.calculate_score }
    @total_score
  end

  def end_game
    puts 'Game over! Your total score is:'
  end
end
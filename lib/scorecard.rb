require_relative 'frame'
require_relative 'last_frame'

class Scorecard
  attr_accessor :player_name, :frames

  def initialize(io)
    @io = io
    @player_name = nil
    @frames = initialize_with_frames
    @frame_scores = [0,0,0,0,0,0,0,0,0,0]
    @rolls = []
  end

  def initialize_with_frames
    result = []
    9.times do
      result << Frame.new
    end
    result << LastFrame.new
    result
  end

  def current_total
    @frame_scores.sum
  end

  def running_total(index)
    @frame_scores[0..index].sum
  end

  def format_scorecard
    result = ''
    result << @player_name << "\n"
    @frames[0..8].each_with_index do |frame, index|
      result << "Frame  #{index + 1} - " << format_frame(frame)
      result << running_total(index).to_s.rjust(5) unless frame.first_roll.nil?
      result << "\n"
    end
    result << "Frame 10 - " << format_last_frame(@frames[9])
    result << running_total(9).to_s.rjust(5) unless @frames[9].first_roll.nil?
    result << "\n"
    result
  end

  def format_frame(frame)
    symbols = [' ',' ']
    if frame.strike?
      symbols = ['X', ' ']
    elsif frame.spare?
      symbols = [frame.first_roll.to_s, '/']
    elsif !frame.first_roll.nil? && !frame.second_roll.nil?
      symbols = [frame.first_roll.to_s, frame.second_roll.to_s]
    # elsif !frame.first_roll.nil? && frame.second_roll.nil?
    #   symbols = [frame.first_roll.to_s, ' ']
    end
    return "| |#{symbols[0]}|#{symbols[1]}|"
  end

  def format_last_frame(last_frame)
    symbols = [num_or_space(last_frame.first_roll),
               num_or_space(last_frame.second_roll),
               num_or_space(last_frame.third_roll)]
    if last_frame.strike?
      symbols[0] = 'X'
    end
    if last_frame.second_strike?
      symbols[1] = 'X'
    end
    if last_frame.third_roll == 10
      symbols[2] = 'X'
    end
    if last_frame.spare?
      symbols[1] = '/'
    end
    return "|#{symbols[0]}|#{symbols[1]}|#{symbols[2]}|"
  end

  def num_or_space(roll)
    return roll.nil? ? ' ' : roll.to_s
  end

  def game
    game_first_nine_frames()
    game_last_frame()
  end

  def game_first_nine_frames
    @frames[0..8].each_with_index do |frame, index|
      frame_num = index + 1
      frame.first_roll = prompt("Frame #{frame_num}, roll 1: ")
      unless frame.strike?
        frame.second_roll = prompt("Frame #{frame_num}, roll 2: ")
      end
      update_totals(frame, index)
      @io.puts format_scorecard
    end
  end

  def game_last_frame
    last_frame = @frames[9]
    last_frame.first_roll = prompt("Frame 10, roll 1: ")
    last_frame.second_roll = prompt("Frame 10, roll 2: ")
    if last_frame.strike? || last_frame.spare? || last_frame.second_strike?
      last_frame.third_roll = prompt("Frame 10, roll 3: ")
    end
    update_totals_last_frame(@frames[9], 9)
    @io.puts format_scorecard
  end

  def update_totals(frame, index)
    @frame_scores[index] += add_if_not_nil(frame.first_roll)
    @frame_scores[index] += add_if_not_nil(frame.second_roll)

    if index > 0
      if @frames[index-1].strike?
        @frame_scores[index-1] += add_if_not_nil(frame.first_roll)
        @frame_scores[index-1] += add_if_not_nil(frame.second_roll)
      elsif @frames[index-1].spare?
        @frame_scores[index-1] += add_if_not_nil(frame.first_roll)
      end
    end

    if index > 1
      if @frames[index-1].strike? && @frames[index-2].strike?
        @frame_scores[index-2] += add_if_not_nil(frame.first_roll)
      end
    end
  end

  def update_totals_last_frame(frame, index)
    update_totals(frame, index)
    @frame_scores[index] += add_if_not_nil(frame.third_roll)

  end

  private

  def prompt(text)
    @io.print(text)
    return_value = @io.gets.chomp.to_i
    return_value
  end

  def add_if_not_nil(roll)
    return roll.nil? ? 0 : roll
  end
end

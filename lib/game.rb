# frozen_string_literal: true

require 'frame'
require 'eleventhframe'

class Game
  attr_reader :total_score

  def initialize
    @frame_number = 1
    @all_rolls = []
    @strikes = []
    @spares = []
    @total_score = 0
    @score_by_frame = []
  end

  def run
    request_user_input_first_10_frames
    if @strikes[9] == true || @spares[9] == true
      frame = EleventhFrame.new(@spares[9])
      frame.run
      record_frame(frame)
      p self
    end
    calculate_all_frame_totals
    calculate_total
  end

  private

  def request_user_input_first_10_frames
    loop do
      frame = Frame.new(@frame_number)
      frame.run
      @frame_number += 1
      record_frame(frame)
      break if @frame_number == 11
    end
  end

  def record_frame(frame)
    rolls = []
    rolls << frame.roll_one
    rolls << frame.roll_two unless frame.roll_two.nil?
    @all_rolls << rolls
    @strikes << frame.strike?
    @spares << frame.spare?
  end

  def calculate_all_frame_totals
    @frame_number = 0
    loop do
      calculate_total_by_frame
      @frame_number += 1
      break if @frame_number == 10
    end
  end

  def calculate_total_by_frame
    frame_score = 0
    if @strikes[@frame_number] == true
      frame_score = calculate_strike_frame_total
    elsif @spares[@frame_number] == true
      frame_score = calculate_spare_frame_total
    else
      frame_score += @all_rolls[@frame_number][0] + @all_rolls[@frame_number][1]
    end
    @score_by_frame[@frame_number] = frame_score
  end

  def calculate_strike_frame_total
    10 + @all_rolls[@frame_number + 1][0] + @all_rolls[@frame_number + 1][1] || @all_rolls[@frame_number + 2][0]
  end

  def calculate_spare_frame_total
    10 + @all_rolls[@frame_number + 1][0]
  end

  def calculate_total
    total = 0
    @score_by_frame.each do |score|
      total += score
    end
    @total_score = total
  end
end

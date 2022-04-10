# frozen_string_literal: true

require_relative './frame'
require_relative './final_frame'

# this class initiates the whole game,
# it is dependant on both the frame and final frame
class Game
  attr_reader :scorecard

  def initialize(frame = Frame.new)
    @current_frame = frame
    @frame_count = 1
    @scorecard = []
  end

  def roll(pins)
    # adds the frame to the scorecard if it's the first roll
    @scorecard << @current_frame if @current_frame.rolls.empty?

    # add pins to the current playing frame
    @current_frame.add_roll(pins)

    distribute_bonus_rolls(pins)

    # after adding a roll we check if the frame
    # is complete and we start a new one
    check_frame
    print_score
  end

  def check_frame
    return unless @current_frame.complete? && @frame_count != 10
    @frame_count += 1
    @current_frame = @frame_count == 10 ? FinalFrame.new : Frame.new

  end

  def print_score
    # if game is complete
    if @frame_count == 10 && @current_frame.score_complete?
      puts "Game finished! Your total score is #{score}"
    else # otherwise print the score for the complete frames
      puts "Your current score is #{score}"
    end
  end

  def score
    @scorecard.map { |frame| frame.score }.sum
  end

  def distribute_bonus_rolls(pins)
    # check if the previous frame needs bonus
    previous_frame = @scorecard.find_index(@current_frame) - 1
    previous_frame.add_bonus(pins)

    # check if the two prior frame needs bonus
    second_to_last_frame = @scorecard.find_index(@current_frame) - 2
    second_to_last_frame.add_bonus(pins)

  end
end

# frozen_string_literal: true

require_relative './frame'
require_relative './final_frame'

# this class initiates the whole game,
# it is dependant on both the frame and final frame
class Game
  attr_reader :scorecard

  def initialize(frame = Frame.new)
    @current_frame = frame
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
    if new_frame_needed
      @current_frame = @scorecard.length == 9 ? FinalFrame.new : Frame.new
    end

    # this prints the current score remember that incomplete frames return 0
    print_score
  end

  def new_frame_needed
    @current_frame.complete? && @scorecard.length != 10
  end

  def print_score
    # if game is complete
    if @scorecard.length == 10 && @current_frame.score_complete?
      puts "Game finished! Your total score is #{score}"
    else # otherwise print the score for the complete frames
      puts "Your current score is #{score}"
    end
  end

  def score
    @scorecard.map(&:score).sum
  end

  def distribute_bonus_rolls(pins)
    # check if the previous frame needs bonus
    previous_frame_index = @scorecard.find_index(@current_frame) - 1
    @scorecard[previous_frame_index].add_bonus(pins) if previous_frame_index >= 0

    # check if the two prior frame needs bonus
    second_to_last_frame_index = @scorecard.find_index(@current_frame) - 2
    @scorecard[second_to_last_frame_index].add_bonus(pins) if second_to_last_frame_index >= 0
  end
end

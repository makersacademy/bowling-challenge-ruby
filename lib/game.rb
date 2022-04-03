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
    @scorecard = {}
  end

  def roll(pins)
    # adds the frame to the scorecard
    @scorecard[@frame_count] = @current_frame

    # add pins to the current playing frame
    @current_frame.add_roll(pins)

    # check if the previous frame needs bonus
    @scorecard[@frame_count - 1]&.add_bonus(pins)

    # check if the two prior frame needs bonus
    @scorecard[@frame_count - 2]&.add_bonus(pins)

    # after adding a roll we check if the frame
    # is complete and we start a new one
    check_frame
    print_score
  end

  def check_frame
    return unless @current_frame.complete? && @frame_count != 10

    @frame_count += 1
    @current_frame = if @frame_count == 10
                       FinalFrame.new
                     else
                       Frame.new
                     end
  end

  def print_score
    # if game is complete
    if @frame_count == 10 && @current_frame.score_complete?
      p "Game finished! Your total score is #{score}"
    else # otherwise print the score for the complete frames
      p "Your current score is #{score}"
    end
  end

  def score
    total_score = 0

    @scorecard.each do |_frame_count, frame|
      total_score += frame.frame_score
    end

    total_score
  end
end

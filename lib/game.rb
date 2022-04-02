require_relative './frame.rb'

class Game

  attr_reader :scorecard

  def initialize(frame = Frame.new)
    @current_frame = frame
    @frame_count = 1
    @scorecard = {}
    
  end


  def roll(pins)

    @current_frame.add_roll(pins)

    if @current_frame.complete?
      @scorecard[@frame_count] = @current_frame
      @frame_count += 1
      @current_frame = Frame.new
    end

  end

  def score
    current_score = 0
    current_score += @current_frame.frame_score
    
    @scorecard.each do |frame_count, frame|
      current_score += frame.frame_score
      if frame.spare
        if scorecard[frame_count+1] == nil
          current_score += @current_frame.rolls[0]
        else 
          current_score += scorecard[frame_count+1].rolls[0]
        end
      end
    end
    current_score
  end

end
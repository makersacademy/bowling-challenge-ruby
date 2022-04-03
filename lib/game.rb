require_relative './frame.rb'
require_relative './final_frame.rb'

class Game

  attr_reader :scorecard

  def initialize(frame = Frame.new)
    @current_frame = frame
    @frame_count = 1
    @scorecard = {}
  end
  
  
  def roll(pins)
    #adds the frame to the scorecard
    @scorecard[@frame_count] = @current_frame

    #add pins to the current playing frame
    @current_frame.add_roll(pins)

    #check if the previous frame needs bonus
    if @scorecard[@frame_count-1] != nil
      @scorecard[@frame_count-1].add_bonus(pins)
    end

    #check if the two prior frame needs bonus
    if @scorecard[@frame_count-2] != nil
      @scorecard[@frame_count-2].add_bonus(pins)
    end

    #after adding a roll we check if the frame
    #is complete and we start a new one
    if @current_frame.complete? && @frame_count != 10
      @frame_count += 1
      if @frame_count == 10
        @current_frame = FinalFrame.new
      else
        @current_frame = Frame.new
      end
    end

    total_score = @scorecard.map{|key, frame| frame.frame_score}.sum
    #if game is complete
    if @frame_count == 10 && @current_frame.score_complete?
      p "Game finished! Your total score is #{total_score}"
    else #otherwise print the score for the complete frames
      p "Your current score is #{total_score}"
    end

  end

  def score
    total_score = 0
    
    @scorecard.each do |frame_count, frame|
      
      current_score += frame.frame_score
      
    end

    current_score

  end




end
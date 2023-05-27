require_relative 'frame'

class ScoreCard
  attr_reader :frames, :current_frame_index

  def initialize
    @frames = []
    @current_frame_index = 0
    @game_score = 0

    10.times do
      frame = Frame.new
      frame.frame_number = @frames.length + 1
      @frames << frame
    end
  end

  def roll_current_frame(pins)
    @frames[@current_frame_index].add_roll(pins)

    if @frames[@current_frame_index].rolls.length == 2 || @frames[@current_frame_index].rolls[0] == 10
      @frames[@current_frame_index].complete = true 
    end

    @current_frame_index += 1 if @frames[@current_frame_index].complete == true 
  end

  def calculate_bonus_scores
    # for spares on regular frames
    @frames.each_with_index do |frame, index|
      next_frame = @frames[index + 1]
      
      if frame.is_spare?
        
        frame.bonus_score = next_frame.rolls[1]
      end
    end
  end

  def calculate_game_score
    @frames.each do |frame|
      @game_score += frame.calculate_frame_score
    end

    return @game_score
  end


end

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

    # handling completion 
    # TODO case when tenth frame
    if @frames[@current_frame_index].rolls.length == 2 || @frames[@current_frame_index].rolls[0] == 10
      @frames[@current_frame_index].complete = true 
    end
    # incrementing current_frame_index if completed
    @current_frame_index += 1 if @frames[@current_frame_index].complete == true 
  end

  def calculate_bonus_scores
    # for spares on regular frames
    # for strikes on regular when next not strike
    # for strikes on regular when next strike
    # TODO spares on tenth
    # TODO strikes on tenth
    @frames.each_with_index do |frame, index|
      next_frame = @frames[index + 1]
      subsequent_frame = @frames[index + 2]
      
      if frame.is_spare?
        frame.bonus_score = next_frame.rolls[0]
      elsif frame.is_strike? && next_frame.is_strike?
        frame.bonus_score = next_frame.rolls[0] + subsequent_frame.rolls[0]
      elsif frame.is_strike?
        frame.bonus_score = next_frame.rolls[0] + next_frame.rolls[1]
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

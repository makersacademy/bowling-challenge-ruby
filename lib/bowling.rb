class Bowling

  attr_reader :frames, :current_frame, :score

  def initialize
    @frames = []
    @current_frame = []
    @frame_count = 1
    @frame_index = 0
    @previous_bowl = 0
    @score = 0
  end

  def roll(pins_hit)
    if @frames.length < 10
      if is_strike?(pins_hit) == true
        @frame_count = 2
      end
      @previous_bowl = pins_hit
      @current_frame << pins_hit
      set_frame
    else
      p "Your score was #{calculate_score}"
    end
  end

  def set_frame
    if @frame_count == 2
      @frames << @current_frame
      @current_frame = []
      @frame_count = 1
    else
      @frame_count += 1
    end
    @frame_index += 1
  end

  def is_strike?(pins_hit)
    pins_hit == 10 ? true : false
  end

  def is_spare?(pins_hit)
    @previous_bowl + pins_hit == 10 ? true : false
  end
  
  def calculate_score
    @frames.each_with_index do |frame, index|
      frame.each do |current_frame|
        @score += current_frame.to_i
        if current_frame == 10
          @score += @frames[index+1][index].to_i
          @score += @frames[index+1][index+1].to_i
        end
      end
    end
    @score
  end
end
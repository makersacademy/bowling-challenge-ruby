class Bowling

  attr_reader :frames, :current_frame, :frame_index, :previous_bowl

  def initialize
    @frames = []
    @current_frame = []
    @frame_count = 1
    @frame_index = 0
    @previous_bowl = 0
    @score = 0
  end

  def roll(pins_hit)
    #if is_strike?(pins_hit) == true
      #set_frame_index(1)
    #elsif is_spare?(pins_hit) == true
      #set_frame_index(1)
    #else
      #set_frame_index(1)
    @previous_bowl = pins_hit
    @current_frame << pins_hit
    @score += @previous_bowl
    if @frame_count == 2
      @frames << @current_frame
      @current_frame = []
      @frame_count = 1
    else
      @frame_count += 1
    end
  end

  def is_strike?(pins_hit)
    pins_hit == 10 ? true : false
  end

  def is_spare?(pins_hit)
    @previous_bowl + pins_hit == 10 ? true : false
  end

  def set_frame_index(frame_index)
    @frame_index == 1 ? @frame_index = 0 : @frame_index = 1
  end

  def info
    p "@frames = #{@frames}"
    p "@current_frame = #{@current_frame}"
    p "@frame_index = #{@frame_index}"
    p "@previous_bowl = #{@previous_bowl}"
  end
end
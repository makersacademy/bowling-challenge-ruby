require_relative './frame'

class Scoresheet
  attr_reader :frames

  def initialize(frame = Frame.new)
    @frames = []
    @current_frame = frame
  end

  def new_frame(frame = Frame.new)
    @current_frame = frame
  end

  def current_frame
    if @frames.length == 9
      tenth_frame
    elsif @current_frame.rolls == 2 || @current_frame.strike?
      @frames << @current_frame
      new_frame unless complete?
    else
      @current_frame
    end
    @current_frame
  end

  def tenth_frame
    if (@current_frame.strike? || @current_frame.spare?) && @current_frame.rolls == 3
      @frames << @current_frame
    elsif @current_frame.rolls == 2
      @frames << @current_frame
    else
      @current_frame
    end
    @current_frame
  end

  def frame_score(num)
    score = 0
    score += strike_bonus(num - 1) if @frames[num - 1].strike?
    score += spare_bonus(num - 1) if @frames[num - 1].spare?
    score += @frames[num - 1].first_roll
    score += @frames[num - 1].second_roll if @frames[num - 1].strike? == false
    score
  end

  def strike_bonus(num)
    if num == 9
      @frames[9].second_roll + @frames[9].bonus_roll
    elsif num == 8 && @frames[9].strike?
      @frames[9].first_roll + @frames[9].second_roll
    elsif @frames[num + 1].strike?
      @frames[num + 1].first_roll + @frames[num + 2].first_roll
    else
      @frames[num + 1].first_roll + @frames[num + 1].second_roll
    end
  end

  def spare_bonus(num)
    if num == 9
      @frames[9].bonus_roll
    else
      @frames[num + 1].first_roll
    end
  end

  def complete?
    @frames.length == 10
  end

  def total_score
    current_frame
    score = 0
    frames = (1..10).to_a
    frames.each do |frame|
      score += frame_score(frame)
    end
    score
  end
end

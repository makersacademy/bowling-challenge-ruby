class Frames

  attr_accessor :frames
  def initialize
    @frames = []
  end

  def create_new(rolls)
    add_bonus_points(rolls)

    if !tenth_frame?
      @frames << { 'rolls' => rolls, 'points' => rolls.sum }
    else
      @frames.last['rolls'] << rolls
    end
  end

  def total_points
    @frames.sum { |frame| frame['points'] }
  end

  def tenth_frame?
    @frames.count == 10
  end

  def previous_was_strike?
    @frames.count > 0 and @frames.last['rolls'].last == 10
  end

  def previous_was_spare?
    @frames.count > 0 and 
    @frames.last['points'] == 10 and
    @frames.last['rolls'][0] != 10
  end

  private

  def add_bonus_points(rolls)
    if previous_was_strike?
      @frames.last['points'] += rolls.sum
    elsif previous_was_spare?
      @frames.last['points'] += rolls[0]
    end
  end
end

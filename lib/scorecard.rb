require_relative 'frame'

class Scorecard

  attr_reader :frames

  def initialize
    @frames = []
    @frames << Frame.new
  end

  def game_finished?
    return true if @frames.length == 11 && @frames[-2].special.empty?
    return true if @frames.length == 11 && @frames[-2].special.first.is_a?(Spare)
    return true if @frames.length == 12 && @frames[-3].special.first.is_a?(Strike)
    false
  end

  def input(pins)
    if (pins + @frames.last.rolls.sum) > 10
      puts "input error, frame would have over 10 pins"
    else
      @frames.last.roll(pins)
      last_frames_specials(pins)
      @frames << Frame.new if @frames.last.complete?
    end
  end

  def last_frames_specials(pins)

    if @frames.length == 2
      if @frames[-2].special.any?
        @frames[-2].special.first.add_bonus(pins) unless @frames[-2].special.first.accounted_for?
      end
    end
    if @frames.length > 2
      if @frames[-2].special.any?
        @frames[-2].special.first.add_bonus(pins) unless @frames[-2].special.first.accounted_for?
      end
      if @frames[-3].special.any?
        @frames[-3].special.first.add_bonus(pins) unless @frames[-3].special.first.accounted_for?
      end
    end
  end

  def score
    total = 0
    @frames.each do |frame|
      total += frame.rolls.sum
      total += frame.special.first.bonus_points.sum if frame.special.any?
    end
    total
  end

end

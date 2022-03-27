# frozen_string_literal: true

# ScoreCard class
class ScoreCard
  attr_reader :pins, :frames

  MAX_PINS = 10

  def initialize
    @pins = []
    @frames = []
    @rolls = 0
    @to_be_named = [
      # { frame: frame_count,
      #   roll: roll_count,
      #   knocked_pins:,
      #   total_score:,
      #   notes:
      # }
    ]
  end

  def strike
    @frames[-2] = MAX_PINS + @pins.last(2).sum
  end

  def spare
    
  end
  
  def total_score
    @frames.sum
  end

  def frame_score
    if @pins[-4] == MAX_PINS && @pins[-3] == 0
      @frames << @pins.last(2).sum
      strike
    elsif @pins.length.odd?
      @pins.last
    else
      @frames << @pins.last(2).sum
    end
  end

  def roll(pins)
    raise "incorrect number of pins" if pins < 0 || pins > MAX_PINS
      if pins == MAX_PINS
        @rolls += 2
        @pins << pins
        @pins << 0
      else 
        @pins << pins
        @rolls += 1
      end
    frame_score
    pins
  end

  def frame_count
    (@rolls / 2.0).round
  end

  def roll_count
    @rolls / frame_count
  end
end

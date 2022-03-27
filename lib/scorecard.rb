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
    @frames[-2] = MAX_PINS + @pins[-2]
  end
  
  def total_score
    @frames.sum
  end

  def frame_score
    frame_unfinished? ? @pins.last : calculate_frame_score
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

  private

  def calculate_frame_score
    if prev_frame_strike?
      store_frame_score
      strike
    elsif prev_frame_spare?
      store_frame_score
      spare
    else
      store_frame_score
    end
  end

  def store_frame_score
    @frames << @pins.last(2).sum
  end

  def prev_frame_strike?
    @pins[-4] == MAX_PINS && @pins[-3] == 0
  end

  def prev_frame_spare?
    @frames.last == MAX_PINS && !prev_frame_strike?
  end

  def frame_unfinished?
    @pins.length.odd?
  end
end

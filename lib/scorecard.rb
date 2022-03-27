# frozen_string_literal: true

require_relative 'incorrect_roll_error'

# ScoreCard class
class ScoreCard
  attr_reader :pins, :frames

  MAX_PINS = 10
  MAX_FRAMES = 10

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

  def total_score
    @frames.sum
  end

  def frame_score
    frame_unfinished? ? @pins.last : calculate_frame_score
  end

  def roll(pins)
    raise IncorrectRollError if pins.negative? || pins > MAX_PINS
    if !@pins.empty? && roll_count == 1 && pins > (MAX_PINS - @pins.last)
      raise IncorrectRollError, 'Number of pins entered exceeds the amount of pins left'
    end
    raise IncorrectRollError, 'The game is over' if frames.length >= MAX_FRAMES

    if frame_unfinished? && pins == MAX_PINS
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
    frame_count.zero? ? 1 : @rolls / frame_count
  end

  private

  def calculate_frame_score
    store_frame_score
    if prev_frame_strike?
      strike
    elsif prev_frame_spare?
      spare
    end
  end

  def store_frame_score
    @frames << @pins.last(2).sum
  end

  def prev_frame_strike?
    @pins[-4] == MAX_PINS && (@pins[-3]).zero?
  end

  def prev_frame_spare?
    @frames.last == MAX_PINS && !prev_frame_strike?
  end

  def frame_unfinished?
    @pins.length.odd? || @pins.length.zero?
  end

  def strike
    @frames[-2] = MAX_PINS + @pins.last(2).sum
  end

  def spare
    @frames[-2] = MAX_PINS + @pins[-2]
  end
end

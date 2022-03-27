# frozen_string_literal: true

require_relative 'frame'

# Game class
class Game
  attr_reader :frames

  MAX_FRAMES = 10
  MAX_PINS = 10

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @frames = []
    @current_frame = nil
  end

  def roll(pins)
    raise IncorrectRollError, 'The game is over' if @frames.length >= MAX_FRAMES

    @current_frame = @frame_class.new if @current_frame.nil? || frame_completed?
    @current_frame.roll(pins)
    frame_score
    pins
  end

  def total_score
    total = 0
    @frames.map { |frame| total += frame.sum }
    total
  end

  def frame_score
    frame_completed? ? count_frame_score : @current_frame.score.first
  end

  private

  def count_frame_score
    @frames << @current_frame.score
    if @frames.length > 1
      strike if prev_frame_strike?
      spare if prev_frame_spare?
    end
  end

  def frame_completed?
    @current_frame.score.length == 2
  end

  def prev_frame_strike?
    @frames[-2][0] == MAX_PINS && @frames[-2].last.zero?
  end

  def prev_frame_spare?
    @frames[-2].sum == MAX_PINS && !prev_frame_strike?
  end

  def strike
    @frames[-2][0] += @frames[-1].sum
  end

  def spare
    @frames[-2][1] += @frames[-1][0]
  end
end

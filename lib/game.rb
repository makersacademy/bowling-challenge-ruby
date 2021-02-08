require_relative 'frame'

class Game
  attr_reader :current_bowl, :frame_number

  def initialize
    @current_bowl = 1
    @frame_number = 1
    create_frames
  end

  def enter_score(score)
    add_bonus_scores(score)
    current_frame.add_score(score) unless bonus_only?
    increment_bowl
    increment_frame
  end

  def total_score
    @frames.inject(0) { |sum, frame| sum + frame.total_score }
  end

  private

  def add_bonus_scores(score)
    @frames.each do |frame|
      frame.add_bonus_score(score) if frame.need_bonus?
    end
  end

  def increment_bowl
    if current_frame.complete?
      @current_bowl = 1
    else
      @current_bowl = 2
    end
  end

  def increment_frame
    @frame_number += 1 if current_frame.complete?
    puts "That's the game folks!" if @frame_number > 10
  end

  def create_frames
    @frames = []
    9.times { @frames << Frame.new }
    @frames << Frame.new(final_frame: true)
  end

  def current_frame
    @frames[@frame_number - 1]
  end

  def bonus_only?
    @frame_number == 10 && (current_frame.complete? || current_frame.need_bonus?)
  end

end

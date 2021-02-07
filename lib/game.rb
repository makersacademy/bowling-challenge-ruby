require_relative 'frame'

class Game
  attr_reader :current_bowl, :current_frame

  def initialize
    @current_bowl = 1
    @current_frame = 1
    create_frames
  end

  def enter_score(score)
    add_bonus_scores(score)
    @frames[@current_frame - 1].add_score(score)
    increment_bowl
    increment_frame
  end

  def total_score
    @frames.inject(0) { |sum, frame| sum += frame.total_score }
  end

  private

  def add_bonus_scores(score)
    @frames.each do |frame|
      frame.add_bonus_score(score) if frame.need_bonus?
    end
  end

  def increment_bowl
    if @frames[@current_frame - 1].complete?
      @current_bowl = 1
    else
      @current_bowl = 2
    end
  end

  def increment_frame
    @current_frame += 1 if @frames[@current_frame - 1].complete?
    puts "That's the game folks!" if @current_frame > 10
  end

  def create_frames
    @frames = []
    9.times { @frames << Frame.new }
    @frames << Frame.new(final_frame: true)
  end

end

class Game

  attr_reader :frames

  def initialize(frame = Frame)
    @frames = []
    set_up_frames(frame)

  end

  def current_score
    score = 0
    frames.each { |frame| score += frame.score if frame.score }
    score
  end

  private

  def set_up_frames(frame)
    number = 1
    10.times do
      @frames << frame.new(number) 
      number += 1
    end
  end

end
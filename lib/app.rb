require_relative 'frame'
require_relative 'gameplay'
require_relative 'scorecard'

class Application
  def initialize
    @frames = {}
    @gameplay = Gameplay.new
    create_frames
  end

  def run
    loopy = true
    while loopy do
      @gameplay.score_prompt(@frames)
      @gameplay.next_ball(@frames)
      
      loopy = @gameplay.continue?
    end

    @gameplay.final_score(@frames)
    puts @frames
    return
  end

  def create_frames
    10.times do |i|
      frame = Frame.new(i + 1)
      @frames[i + 1] = frame
    end
  end

  def return_frames
    return @frames
  end
end

unless ENV['ENV'] == 'test'
  app = Application.new
  app.run
end

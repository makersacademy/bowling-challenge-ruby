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
      success = @gameplay.score_prompt(@frames)
      @gameplay.next_ball(@frames) if success == true
      loopy = @gameplay.continue?(@frames)
    end
    @gameplay.final_score(@frames)
    return
  end

  def create_frames
    10.times do |i|
      frame = Frame.new
      @frames[i + 1] = frame
    end
  end
end

unless ENV['ENV'] == 'test'
  app = Application.new
  app.run
end

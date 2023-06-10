require_relative 'frame'
require_relative 'gameplay'

class Application
  def initialize
    @frames = {}
    @gameplay = Gameplay.new
    create_frames
  end

  def run
    loopy = true
    while loopy do
      @gameplay.score_prompt
      @gameplay.next_ball
      loopy = @gameplay.continue?
    end

    @gameplay.final_score(@frames)
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

app = Application.new
app.run
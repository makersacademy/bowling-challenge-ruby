require_relative 'lib/bowling'
require_relative 'lib/scorecard'

class Application

  Frames = 10

  def play
    bowling = Bowling.new(Kernel)
    scorecard = Scorecard.new

    9.times do |i|
      frame = bowling.frame
      scorecard.add_frame(frame)
    end

    # 10th frame?
    frame_10 = bowling.frame
    scorecard.add_final_frame(frame_10)

    p scorecard.scores
  end
end

app = Application.new
app.play
class ScoreBoard
  class << self
    def total_score(frames)
      self.frames = frames
      frame_scores(frames).sum
    end

    def frame_scores(frames)
      frames.map(&:score)
    end


    def scores_and_rolls(frames)
      frames.map { |frame| { rolls: frame.rolls, score: frame.score } }
    end

    private

    attr_accessor :frames
  end
end

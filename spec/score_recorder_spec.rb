require 'score_recorder'

describe ScoreRecorder do
  subject(:scorerecorder) { ScoreRecorder.new }

  describe '#current_frame' do
    it 'returns 1 for new game' do
      frames = []
      expect(scorerecorder.current_frame(frames)).to eq(1)
    end
  end
end

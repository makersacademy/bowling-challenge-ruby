require 'score_recorder'

describe ScoreRecorder do
  subject(:scorerecorder) { described_class.new }

  describe '#next_input_row' do
    it 'returns 1 for new game' do
      frames = []
      expect(scorerecorder.next_input_roll(frames)).to eq(1)
    end
  end

  describe '#next_input_frame' do
    it 'returns 1 for new game' do
      frames = []
      expect(scorerecorder.next_input_frame(frames)).to eq(1)
    end

    it 'returns 1 after one (non-strike) roll' do
      frames = [[9]]
      expect(scorerecorder.next_input_frame(frames)).to eq(1)
    end

    it 'returns 2 after two (non-strike) rolls' do
      frames = [[3, 4]]
      expect(scorerecorder.next_input_frame(frames)).to eq(2)
    end
  end
end

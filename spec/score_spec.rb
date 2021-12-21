require 'score'

describe Score do
  let(:score) { Score.new }

  describe '#get_each_frame' do
    context 'returns total score from each frame added'
    it 'returns score from first frame' do
      expect(score.get_total([1,4])).to eq 5
    end
    it 'returns score from 2 frames' do
      score.get_total([1,4])
      expect(score.get_total([4,5])).to eq 14
    end
  end
end
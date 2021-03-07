describe ScoreBoard do
  before { described_class.total_score([frame1, frame2, frame3, frame4]) }

  let(:frame1) { instance_double(Frame, :frame1, rolls: [5, 3], bonus: 0, score: 8) }
  let(:frame2) { instance_double(Frame, :frame2, rolls: [6, 4], bonus: 10, score: 20) }
  let(:frame3) { instance_double(Frame, :frame3, rolls: [10], bonus: 7, score: 17) }
  let(:frame4) { instance_double(Frame, :frame4, rolls: [4, 3], bonus: 0, score: 7) }

  describe '.total_score' do
    it 'calculates the total score for 1 frame' do
      expect(frame1).to receive(:score)
      expect(described_class.total_score([frame1])).to eq 8
    end

    it 'calculates the total score for mulitple frames' do
      frames = [frame1, frame2, frame3, frame4]

      expect(frame1).to receive(:score)
      expect(frame2).to receive(:score)
      expect(frame3).to receive(:score)
      expect(frame4).to receive(:score)

      expect(described_class.total_score(frames)).to eq 52
    end
  end

  describe '.scores_and_rolls' do
    it 'returns the rolls and scores for each frame' do
      expect(described_class.scores_and_rolls).to eq [
        { rolls: [5, 3], score: 8 },
        { rolls: [6, 4], score: 20 },
        { rolls: [10], score: 17 },
        { rolls: [4, 3], score: 7 }
      ]
    end
  end

  describe '.running_total' do
    it 'outputs the scores as a running total' do
      expect(described_class.running_total).to eq [8, 28, 45, 52]
    end
  end
end

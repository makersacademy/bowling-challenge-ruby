describe ScoreBoard do
  let(:frame1) { instance_double(Frame, :frame1, rolls: [5, 3], bonus: 0, score: 8) }
  let(:frame2) { instance_double(Frame, :frame2, rolls: [6, 4], bonus: 10, score: 10) }
  let(:frame3) { instance_double(Frame, :frame3, rolls: [10], bonus: 7, score: 17) }
  let(:frame4) { instance_double(Frame, :frame4, rolls: [4, 3], bonus: 0, score: 7) }

  describe '.total_score' do
    it 'calculates the total score for 1 frame' do
      frames = [frame1]

      expect(frame1).to receive(:score)
      expect(described_class.total_score(frames)).to eq 8
    end

    it 'calculates the total score for mulitple frames' do
      frames = [frame1, frame2, frame3, frame4]

      expect(frame1).to receive(:score)
      expect(frame2).to receive(:score)
      expect(frame3).to receive(:score)
      expect(frame4).to receive(:score)

      expect(described_class.total_score(frames)).to eq 42
    end
  end

  describe '.frame_scores' do
    it 'reurns each frame score' do
      frames = [frame1, frame2, frame3, frame4]
      expect(described_class.frame_scores(frames)).to eq [8, 10, 17, 7]
    end
  end

  describe '.scores_and_rolls' do
    it 'returns the rolls and scores for each frame' do
      frames = [frame1, frame2, frame3, frame4]

      expect(described_class.scores_and_rolls(frames)).to eq [
        { rolls: [5, 3], score: 8 },
        { rolls: [6, 4], score: 10 },
        { rolls: [10], score: 17 },
        { rolls: [4, 3], score: 7 }
      ]
    end
  end
end

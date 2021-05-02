require 'score_card'

describe ScoreCard do
  subject(:scorecard) { described_class.new }

  describe '#frame_scores' do
    context 'when less than 10 frames played' do
      it 'returns score for one non-strike/spare frame' do
        frames = [[3, 4]]
        scores = [7]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score for two non-strike/spare frames' do
        frames = [[2, 1], [5, 0]]
        scores = [3, 5]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when spare achieved (not on last frame)' do
        frames = [[5, 5], [2, 4]]
        scores = [12, 6]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when spare achieved on last frame' do
        frames = [[3, 4], [2, 8]]
        scores = [7, 10]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when strike achieved (not on last frame)' do
        frames = [[10], [6, 1]]
        scores = [17, 7]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end

      it 'returns score when strike achieved on last frame' do
        frames = [[9, 0], [10]]
        scores = [9, 10]
        expect(scorecard.frame_scores(frames)).to eq(scores)
      end
    end

    context 'when 10 frames played' do
      let (:nine_frames) do
        nine_frames = []
        9.times { nine_frames << [0, 0] }
        nine_frames
      end
      let (:tenth_index) { 9 }
      
      it 'returns score for non-strike/spare in 10th frame' do
        frames = nine_frames << [4, 1]
        tenth_frame_score = 5
        expect(scorecard.frame_scores(frames)[tenth_index]).to eq(tenth_frame_score)
      end

      it 'returns score for spare in 10th frame (extra roll not yet rolled)' do
        frames = nine_frames << [8, 2]
        tenth_frame_score = 10
        expect(scorecard.frame_scores(frames)[tenth_index]).to eq(tenth_frame_score)
      end

      it 'returns score for spare in 10th frame with extra roll' do
        frames = nine_frames << [1, 9, 2]
        tenth_frame_score = 12
        expect(scorecard.frame_scores(frames)[tenth_index]).to eq(tenth_frame_score)
      end

      it 'returns score for strike in 10th frame (extra roll not yet rolled)' do
        frames = nine_frames << [10]
        tenth_frame_score = 10
        expect(scorecard.frame_scores(frames)[tenth_index]).to eq(tenth_frame_score)
      end

      it 'returns score for strike in 10th frame with extra rolls' do
        frames = nine_frames << [10, 3, 10]
        tenth_frame_score = 23
        expect(scorecard.frame_scores(frames)[tenth_index]).to eq(tenth_frame_score)
      end

      xit 'example test' do
        frames = [
          [1, 4],
          [4, 5],
          [6, 4],
          [5, 5],
          [10],
          [0, 1],
          [7, 3],
          [6, 4],
          [10],
          [2, 8, 6]
        ]
        score_total = 133
        p scorecard.frame_scores(frames)
        expect(scorecard.frame_scores(frames).sum).to eq(score_total)
      end
    end
  end
end

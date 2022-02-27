require 'bowling'

describe Bowling do
  let(:game) { described_class.new }

  describe '#total_frames' do
    it 'User must enter scores for a minimum of 10 frames' do
      expect do
        game.total_frames([[9, 0], [9, 0], [9, 0], [9, 0], [9, 0], [9, 0], [9, 0], [9, 0],
                           [9, 0]])
      end.to raise_error 'Minimum of 10 frames must be entered'
    end
  end

  describe '#total_score' do
    context 'when no strikes or spares' do
      before do
        @frame_scores = [[1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0]]
      end
      it 'returns the correct sum of all frames' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 10
      end
    end
    context 'when player gets a strike' do
      before do
        @frame_scores = [[10, 0], [1, 1], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0]]
      end
      it 'adds bonus scores onto that frame equal to both scores from the next frame' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 22
      end
    end
    context 'when player gets a spare' do
      before do
        @frame_scores = [[1, 9], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0], [1, 0]]
      end
      it 'adds bonus scores onto that frame equal to the first score from the next frame' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 20
      end
    end
    context 'when player has a perfect game' do
      before do
        @frame_scores = [[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0],
                         [10, 0], [10, 0]]
      end
      it 'returns the maximum score of 300' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 300
      end
    end
    context 'when a player gets all spares' do
      before do
        @frame_scores = [[8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 2], [8, 0]]
      end
      it 'returns the correct score of 180' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 180
      end
    end
  end
end

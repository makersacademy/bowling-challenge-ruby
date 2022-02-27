require 'bowling'

describe Bowling do

  let(:game) { described_class.new }

  describe '#total_frames' do
      it 'User must enter scores for a minimum of 10 frames' do
        expect { game.total_frames([[9,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0],[9,0]]) }.to raise_error "Minimum of 10 frames must be entered"
      end
  end

  describe '#total_score' do
    context 'when no strikes or spares' do
      before do
        @frame_scores = [[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0]]
      end
      it 'returns the correct sum of all frames' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 10
      end
    end
    context 'when player gets a strike' do
      before do
        @frame_scores = [[10,0],[1,1],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0]]
      end
      it 'adds bonus scores onto that frame equal to both scores from the next frame' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 22
      end
    end
    context 'when player gets a spare' do
      before do
        @frame_scores = [[1,9],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0],[1,0]]
      end
      it 'adds bonus scores onto that frame equal to the first score from the next frame' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 20
      end
    end
    context 'when player has a perfect game' do
      before do
        @frame_scores = [[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0]]
      end
      it 'returns the maximum score of 300' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 300
      end
    end
    context 'when a player gets all spares' do
      before do
        @frame_scores = [[8,2],[8,2],[8,2],[8,2],[8,2],[8,2],[8,2],[8,2],[8,2],[8,2],[8,0]]
      end
      it 'returns the correct score of 180' do
        game.total_frames(@frame_scores)
        expect(game.total_score).to eq 180
      end
    end
  end
  # describe '#frame_score' do
  #   it 'saves the score from the two rolls in a frame to the total score' do
  #     game.frame_score(3, 2)
  #     expect(game.total_score).to eq 5
  #   end
  #   it 'current frame increases by 1 after each score is entered' do
  #     expect(game.frame).to eq 1
  #     game.frame_score(2, 4)
  #     expect(game.frame).to eq 2
  #   end
  #   it 'if a player gets a strike or a spare, the total score is not immediately updated' do
  #     game.frame_score(10, 0)
  #     expect(game.total_score).to eq 0
  #   end
  #   it 'if a player gets a strike, the following frame_score will be doubled' do
  #     game.frame_score(10, 0)
  #     expect(game.frame).to eq 2
  #     expect(game.total_score).to eq 0
  #     game.frame_score(2, 3)
  #     expect(game.total_score).to eq 20
  #   end

end
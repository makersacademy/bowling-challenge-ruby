require './lib/game'

describe Game do
  let(:game) { described_class.new }

  describe '#enter_score' do
    context 'when it is the first bowl of a frame' do
      context 'when you enter a score of 0-9' do
        let(:score) { 7 }
        subject { game.enter_score(score) }
        it 'changes the total score by that amount' do
          expect { subject }.to change { game.total_score }.by score
        end
        it 'changes the current bowl' do
          expect { subject }.to change { game.current_bowl }.to 2
        end
        it 'maintains the current frame' do
          expect { subject }.not_to change { game.current_frame }
        end
      end
    end
  end

end

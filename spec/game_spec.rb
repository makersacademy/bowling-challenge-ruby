require './lib/game'

describe Game do
  let(:game) { described_class.new }

  describe '#enter_score' do
    subject { game.enter_score(score) }

    context 'when it is the first bowl of a frame' do
      context 'when you enter a score of 0-9' do
        let(:score) { 7 }
        it 'changes the total score by that amount' do
          expect { subject }.to change { game.total_score }.by score
        end
        it 'changes the current bowl' do
          expect { subject }.to change { game.current_bowl }.to 2
        end
        it 'maintains the current frame' do
          expect { subject }.not_to(change { game.current_frame })
        end
      end

      context 'when you get a strike (enter 10)' do
        let(:score) { 10 }
        let(:subsequent_scores) { [4, 5] }
        let(:enter_subsequent) { subsequent_scores.each { |score| game.enter_score(score) } }
        it 'changes the frame' do
          expect { subject }.to change { game.current_frame }.by 1
        end
        it 'leaves the current bowl as 1' do
          expect { subject }.not_to(change { game.current_bowl })
        end
        it 'initially increases the score by 10' do
          expect { subject }.to change { game.total_score }.by 10
        end
        it 'then adds subsequent two bowls twice, once as bonus' do
          game.enter_score(10)
          expect { enter_subsequent }.to change { game.total_score }.by 2 * subsequent_scores.sum
        end
        context 'when the next bowl is also a strike' do
          let(:enter_subsequent_strike) { [10, 5].each { |score| game.enter_score(score) } }
          it 'adds the second strike twice, and the subsequent shot three times' do
            score_increment = 10 * 2 + 5 * 3
            game.enter_score(10)
            expect { enter_subsequent_strike }.to change { game.total_score }.by score_increment
          end
        end
      end
    end

    context 'when it is the second bowl of a frame' do
      let(:first_score) { 5 }
      let(:second_score) { 4 }
      before { game.enter_score(first_score) }
      subject { game.enter_score(second_score) }
      it 'moves to the next frame' do
        expect { subject }.to change { game.current_frame }.by 1
      end
      it 'sets the current bowl to 1' do
        expect { subject }.to change { game.current_bowl }.from(2).to(1)
      end
    end
    
  end

end

require 'bowling_score'

describe BowlingScore do
  let(:player1) { BowlingScore.new }

  describe '#roll' do

    context 'when second roll of the frame' do
      context 'when not spare' do
        it 'changes total score by number of pins knocked down' do
          expect {
            player1.roll(5)
            player1.roll(2)
          }.to change { player1.total_score }.by(7)
        end
      end
    end
  end
end

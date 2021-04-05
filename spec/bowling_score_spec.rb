require 'bowling_score'

describe BowlingScore do
  let(:player1) { BowlingScore.new }

  describe '#roll' do
    context 'when first roll of the frame' do
      it "doesn't affect frame number" do
        expect { player1.roll(5) }.not_to change { player1.frame_number }
      end

      it "doesn't affect total score" do
        expect { player1.roll(5) }.not_to change { player1.total_score }
      end
    end

    context 'when second roll of the frame' do
      it 'changes frame number' do
        player1.roll(5)
        expect { player1.roll(2) }.to change { player1.frame_number }.by(1)
      end

      context 'when not spare' do
        it 'changes total score by number of pins knocked down' do
          player1.roll(5)
          expect { player1.roll(2) }.to change { player1.total_score }.by(7)
        end
      end

      context 'when not last frame' do
        it 'resets current frame to an empty array' do
          player1.roll(5)
          expect { player1.roll(2) }.to change { player1.current_frame.length }.to(0)
        end
      end
    end
  end
end

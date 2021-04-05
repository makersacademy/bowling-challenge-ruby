require 'bowling_score'

describe BowlingScore do
  let(:player1) { BowlingScore.new }

  describe '#roll' do
    context 'when first roll of the frame' do
      context 'when not strike' do
        it "doesn't affect frame number" do
          expect { player1.roll(5) }.not_to change { player1.frame_number }
        end
      end
      
      context 'when strike' do
        it 'changes frame number' do
          expect { player1.roll(10) }.to change { player1.frame_number }.by(1)
        end
      end

      it "doesn't affect total score" do
        expect { player1.roll(5) }.not_to change { player1.total_score }
      end
    end

    context 'when second roll of the frame' do
      context 'when not last frame' do
        it 'changes frame number' do
          player1.roll(5)
          expect { player1.roll(2) }.to change { player1.frame_number }.by(1)
        end

        it 'resets current frame to an empty array' do
          player1.roll(5)
          expect { player1.roll(2) }.to change { player1.current_frame.length }.to(0)
        end
      end

      context 'when not spare' do
        it 'changes total score by number of pins knocked down' do
          player1.roll(5)
          expect { player1.roll(2) }.to change { player1.total_score }.by(7)
        end
      end

      context 'when spare' do
        xit "doesn't change score before bonus is calculated" do
          # This is to fully adhere to how it works in bowling halls, but not part of the brief
        end
      end
    end

    context 'when following a spare' do
      it 'adds spare bonus based on first roll of next frame' do
        player1.roll(8)
        player1.roll(2)
        expect { player1.roll(3) }.to change { player1.total_score }.by(3)
      end

      it "doesn't adds spare bonus for second roll of next frame" do
        # Test added because first attempt at spare_bonus? added bonus for each roll of next frame
        player1.roll(8)
        player1.roll(2)
        player1.roll(3)
        expect { player1.roll(4) }.to change { player1.total_score }.by(7)
      end
    end
  end
end

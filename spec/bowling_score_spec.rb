require 'bowling_score'

describe BowlingScore do
  let(:player1) { BowlingScore.new }

  describe '#roll' do
    context 'when first roll of the frame' do
      context 'when not strike' do
        it "doesn't affect frame number" do
          expect { player1.roll(5) }.not_to change { player1.frame_number }
        end

        it "doesn't affect total score" do
          expect { player1.roll(5) }.not_to change { player1.total_score }
        end
      end
      
      context 'when strike' do
        it 'changes frame number' do
          expect { player1.roll(10) }.to change { player1.frame_number }.by(1)
        end

        it 'adds to score' do
          expect { player1.roll(10) }.to change { player1.total_score }.by(10)
        end
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

    context 'when following a strike' do
      it 'adds strike bonus based on first roll of next frame' do
        player1.roll(10)
        expect { player1.roll(3) }.to change { player1.total_score }.by(3)
      end

      it 'adds strike bonus based on second roll of next frame on top of next frame score' do
        player1.roll(10)
        player1.roll(3)
        expect { player1.roll(4) }.to change { player1.total_score }.by(11)
        # Increase of 11 made up of 7 (overall frame score for [3,4]) and 4 (second strike bonus)
      end

      context 'when two strikes in a row' do
        it 'adds strike bonus based on strike in next frame' do
          player1.roll(10)
          expect { player1.roll(10) }.to change { player1.total_score }.by(20)
          # Increase of 20 is made up of 10 (overall frame score for second strike) and 10 (first bonus for first strike)
        end

        it 'adds two strike bonuses simultaneously for first roll after two strikes' do
          player1.roll(10)
          player1.roll(10)
          expect { player1.roll(8) }.to change { player1.total_score }.by(16)
          # Increase of 16 is made up of 8 (second bonus for first strike) and 8 (first bonus for second strike)
        end
      end
    end
  end
end

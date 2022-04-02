require 'bowling_score'

describe BowlingScore do
  subject(:score) { described_class.new('Paul') }

  it "stores a player's name" do
    expect(score.name).to eq 'Paul'
  end
  
  it 'stores a default score of 0' do
    expect(score.frame_score(1)).to eq 0
  end

  describe '#add' do
    it 'adds to the score' do
      expect { score.add(5) }.to change { score.total_score }.by(5)
    end
  end

  describe '#next_frame_number' do
    context 'when no frames have been scored' do
      it 'returns 1' do
        expect(score.next_frame_number).to eq 1
      end
    end
    context 'when a frame has already been created' do
      it 'returns the next frame number' do
        score.add_new_frame
        expect(score.next_frame_number).to eq 2
      end
    end
  end

  describe '#game_complete?' do
    context 'if all ten frames are not finished' do
      it 'returns false' do
        expect(score.game_complete?).to be false
      end
    end
    context 'if all ten frames are finished' do
      it 'returns true' do
        12.times { score.add(10) }
        expect(score.game_complete?).to be true
      end
    end
  end

  describe '#previous_frame' do
    context 'when no frames have been scored' do
      it 'returns nil' do
        expect(score.previous_frame).to eq nil
      end
    end
    context 'when only one frame has been scored' do
      it 'returns nil' do
        expect(score.previous_frame).to eq nil
      end
    end
    context 'when one complete frame has been fully scored' do
      it 'returns that frame' do
        frame = score.current_frame
        score.add(1)
        score.add(1)
        score.add(1)
        expect(score.previous_frame).to be frame
      end
    end
  end
end

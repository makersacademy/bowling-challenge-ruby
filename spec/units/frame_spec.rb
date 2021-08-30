require 'frame'

describe Frame do
  describe '#initialize' do
    it 'starts with a score of 0' do
      expect(subject.frame_score).to eq 0
    end
  end

  describe '#add_roll' do
    it 'updates the current roll counter' do
      expect{ subject.add_roll(5) }.to change{ subject.current_roll }.by(+1)
    end

    it 'adds the roll to the frame score' do
      expect{ subject.add_roll(5) }.to change{ subject.frame_score }.by(+5)
    end
  end

  describe '#strike?' do
    context '10 pins on first roll' do
      it 'returns true' do
        subject.add_roll(10)
        expect(subject.strike?).to eq true
      end
    end
  end
end

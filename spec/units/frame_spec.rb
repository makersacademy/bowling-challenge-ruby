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

  describe '#update_rolls_remaining' do
    context 'strike' do
      it "doesn't change rolls remaining" do
        expect{ subject.add_roll(10) }.not_to change{ subject.rolls_remaining }
      end
    end
    context 'split' do
      it "doesn't change rolls remaining" do
        subject.add_roll(5)
        expect{ subject.add_roll(5) }.not_to change{ subject.rolls_remaining }
      end
    end
    context 'not a strike or split' do
      it "reduces rolls remaining by 1" do
        expect{ subject.add_roll(5) }.to change{ subject.rolls_remaining }.by(-1)
      end
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

  describe '#split?' do
    context '10 pins over first and second roll' do
      it 'returns true' do
        subject.add_roll(5)
        subject.add_roll(5)
        expect(subject.split?).to eq true
      end
    end
  end

  describe '#frameover?' do
    context 'frame has rolls remaining' do
      it 'returns false' do
        subject.add_roll(5)
        expect(subject.frameover?).to eq false
      end
    end

    context 'frame has no rolls remaining' do
      it 'returns true' do
        subject.add_roll(5)
        subject.add_roll(2)
        expect(subject.frameover?).to eq true
      end
    end
  end
end

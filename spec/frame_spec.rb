describe Frame do
  describe '#score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe '#add_roll' do
    context 'first roll' do
      it 'is added to score' do
        subject.add_roll(3)
        expect(subject.score).to be 3
      end

      it 'is recorded in roll1' do
        subject.add_roll(3)
        expect(subject.roll1).to be 3
      end
    end

    context 'second roll' do
      it 'is added to score' do
        subject.add_roll(3)
        subject.add_roll(5)
        expect(subject.score).to be 8
      end

      it 'is recorded in roll2' do
        subject.add_roll(3)
        subject.add_roll(5)
        expect(subject.roll2).to be 5
      end

      it 'does not change roll1' do
        subject.add_roll(3)
        subject.add_roll(5)
        expect(subject.roll1).to be 3
      end
    end

    context 'when player inputs > 10 on first roll' do
      it 'raises error' do
        expect { subject.add_roll(11) }.to raise_error PinError
      end
    end

    context 'when player inputs > 10 across 2 rolls' do
      it 'raises error' do
        subject.add_roll(5)
        expect { subject.add_roll(6) }.to raise_error PinError
      end
    end
  end

  describe '#over?' do
    context 'after no rolls' do
      it { is_expected.not_to be_over }
    end

    context 'after 1 roll' do
      it 'is not over' do
        subject.add_roll(8)
        expect(subject).not_to be_over
      end

      it 'is over if roll was a strike' do
        subject.add_roll(10)
        expect(subject).to be_over
      end
    end

    context 'after 2 rolls' do
      it 'is over' do
        2.times { subject.add_roll(3) }
        expect(subject).to be_over
      end
    end
  end

  describe '#remaining_pins' do
    it 'starts at 10' do
      expect(subject.remaining_pins).to be 10
    end

    it 'decreases by roll score after each roll' do
      expect { subject.add_roll(5) }.to change { subject.remaining_pins }.by(-5)
    end
  end

  describe '#bonus' do
    it 'starts at 0' do
      expect(subject.bonus).to be_zero
    end
  end

  describe '#strike?' do
    context 'when player rolls a strike' do
      it 'returns true' do
        subject.add_roll(10)
        expect(subject).to be_strike
      end
    end

    context 'when player does not roll a strike' do
      it 'returns false' do
        subject.add_roll(9)
        expect(subject).not_to be_strike
      end
    end
  end

  describe '#spare?' do
    context 'when player rolls a spare' do
      it 'returns true' do
        subject.add_roll(7)
        subject.add_roll(3)
        expect(subject).to be_spare
      end
    end

    context 'when player does not roll a spare' do
      it 'returns false' do
        subject.add_roll(7)
        subject.add_roll(2)
        expect(subject).not_to be_spare
      end
    end
  end

  describe 'add_bonus' do
    it 'adds a score to the bonus' do
      expect { subject.add_bonus(2) }.to change { subject.bonus }.by(2)
    end
  end
end

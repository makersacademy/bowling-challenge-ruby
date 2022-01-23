require 'frame'

describe Frame do 
  describe 'score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe 'add_roll' do
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
  end

  describe 'over?' do
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
end
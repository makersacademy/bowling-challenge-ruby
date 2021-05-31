require 'frame'

describe Frame do
  describe '#pinfall' do
    it 'returns the total pinfall of the frame' do
      subject.roll(3)
      subject.roll(4)
      expect(subject.pinfall).to eq(7)
    end
  end

  describe '#strike?' do
    context 'when the first roll of a frame is 10' do
      it 'returns true' do
        subject.roll(10)
        expect(subject.strike?).to be_truthy
      end
    end

    context 'when the first roll of a frame is not 10' do
      it 'returns false' do
        subject.roll(0)
        subject.roll(10)
        expect(subject.strike?).to be_falsy
      end
    end
  end

  describe '#spare?' do
    context 'when the sum of both rolls for a frame is 10' do
      it 'returns true' do
        subject.roll(4)
        subject.roll(6)
        expect(subject.spare?).to be_truthy
      end
    end

    context 'when the sum of both rolls for a frame is less than 10' do
      it 'returns false' do
        subject.roll(3)
        subject.roll(4)
        expect(subject.spare?).to be_falsy
      end
    end

    context 'when the first roll of a frame is 10' do
      it 'returns false' do
        subject.roll(10)
        expect(subject.spare?).to be_falsy
      end
    end
  end
end

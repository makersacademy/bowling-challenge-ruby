# frozen_string_literal: true

require 'frame'

describe Frame do
  describe '#pinfall' do
    it 'returns the total pinfall of the frame, excluding bonuses' do
      subject.roll(3)
      subject.roll(4)
      expect(subject.pinfall).to eq(7)
    end
  end

  describe '#rolls' do
    it 'returns the number of rolls currently in the frame' do
      subject.roll(3)
      subject.roll(4)
      expect(subject.rolls).to eq(2)
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

  describe '#add_bonus' do
    it 'adds to the score of the frame, but not the pinfall' do
      subject.roll(3)
      subject.roll(4)
      expect(subject.pinfall).to eq(7)
      subject.add_bonus(3)
      subject.add_bonus(6)
      expect(subject.score).to eq(16)
    end
  end
end

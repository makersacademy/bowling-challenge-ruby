# frozen_string_literal: true

require 'frame'

describe Frame do
  describe '#roll' do
    context 'within pins left' do
      it 'changes pins left' do
        expect { subject.roll(6) }.to change { subject.pins_left }.by(-6)
      end
    end

    context 'exceed max first roll 10' do
      it 'raise error' do
        expect { subject.roll(11) }.to raise_error 'not enough pins left'
      end
    end

    context 'exceed pins left' do
      it 'raise error' do
        subject.roll(6)
        expect { subject.roll(5) }.to raise_error 'not enough pins left'
      end
    end

    context 'pins left does not apply to bonus roll' do
      it 'adds knocked pins to score' do
        subject.roll(6)
        expect { subject.roll(10, true) }.to change { subject.score }.by(10)
      end
    end

    context 'exceed max bonus roll 10' do
      it 'raise error' do
        expect { subject.roll(11, true) }.to raise_error 'not enough pins left'
      end
    end
  end

  describe '#rolls' do
    it 'returns empty rolls at start' do
      expect(subject.rolls).to be_empty
    end

    it 'adds one roll object to rolls' do
      subject.roll(6)
      expect(subject.rolls[0]).to be_a Roll
    end
  end

  describe '#add_score' do
    it 'adds score' do
      expect { subject.add_score(6) }.to change { subject.score }.by(6)
    end
  end
end

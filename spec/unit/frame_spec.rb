require 'frame'

describe Frame do
  subject(:frame) { described_class.new(1) }

  it 'stores which number frame it is' do
    expect(frame.number).to eq 1
  end

  it 'starts with an empty array of scores' do
    expect(frame.scores).to be_empty
  end

  describe '#add' do
    it 'adds a score to scores' do
      expect { frame.add(1) }.to change { frame.scores.length }.by(1)
    end
    it 'raises an error if there are already two scores' do
      frame.add(1)
      frame.add(1)
      expect { frame.add(1) }.to raise_error 'This frame is complete'
    end
  end

  describe '#complete?' do
    context 'if two scores have been added' do
      it 'returns true' do
        frame.add(1)
        frame.add(1)
        expect(frame.complete?).to be true
      end
    end
    context 'if a strike has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS)
        expect(frame.complete?).to be true
      end
    end
    context 'if there are less than 2 scores and no strike' do
      it 'returns false' do
        frame.add(Frame::TOTAL_PINS - 1)
        expect(frame.complete?).to be false
      end
    end
  end

  describe '#strike' do
    context 'if a strike has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS)
        expect(frame.strike?).to be true
      end
    end
    context 'if a strike has not been scored' do
      it 'returns false' do
        frame.add(Frame::TOTAL_PINS - 1)
        frame.add(1)
        expect(frame.strike?).to be false
      end
    end
  end

  describe '#spare' do
    context 'if a spare has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS - 1)
        frame.add(1)
        expect(frame.spare?).to be true
      end
    end
    context 'if a spare has not been scored' do
      it 'returns false' do
        frame.add(1)
        frame.add(1)
        expect(frame.spare?).to be false
      end
    end
  end
end

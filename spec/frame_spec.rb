require 'frame'

describe Frame do

  subject(:frame) { described_class.new }

  describe '#add_first_roll' do
    it 'adds 2 pins to first roll in first frame' do
      expect(frame.add_first_roll(2)).to eq [2]
    end
  end

  describe '#add_second_roll' do
    it 'adds 7 pins to second roll in first frame' do
      frame.add_first_roll(2)
      frame.add_second_roll(7)
      expect(frame.frames[1]).to eq [2, 7]
    end

    it 'returns next frame if score strike in previous roll' do
      frame.add_first_roll(10)
      expect(frame.add_second_roll(2)).to eq 3
    end
  end

  context 'strike' do
    describe '#add-first_roll' do
      it 'scores strike at first roll' do
        frame.add_first_roll(10)
        expect(frame.strike?).to eq true
      end

      it 'adds 10 pins (strike) and completes the second roll with zero by default' do
        frame.add_first_roll(10)
        expect(frame.frames[1]).to eq [10, 0]
      end

      it 'adds the bonus scores for previous strike' do
        frame.add_first_roll(5)
        frame.add_second_roll(2)
        frame.add_first_roll(10)
        frame.add_first_roll(2)
        frame.add_second_roll(3)
        expect(frame.frames[2]).to eq [10, 5]
      end
    end
  end

  context 'spare' do
    describe '#add-first_roll' do
      it 'adds the bonus scores for previous spare' do
        frame.add_first_roll(5)
        frame.add_second_roll(5)
        frame.add_first_roll(3)
        frame.add_second_roll(4)
        expect(frame.frames[1]).to eq [5, 8]
      end
    end

    describe '#add_second_roll' do
      it 'scores spare at second roll' do
        frame.add_first_roll(2)
        frame.add_second_roll(8)
        expect(frame.spare?).to eq true
      end
    end
  end

  describe '#new_current_frame' do
    it 'it changes the frame (turn) to the next one' do
      frame.add_first_roll(2)
      frame.add_second_roll(7)
      expect(frame.current_frame).to eq 2
    end

    it 'it changes the frame (turn) to the next one after the first roll if strike' do
      frame.add_first_roll(10)
      expect(frame.current_frame).to eq 2
    end
  end

  describe '#frame_complete?' do
    it 'returns true if frame is complete' do
      frame.add_first_roll(2)
      frame.add_second_roll(7)
      expect(frame.complete?(1)).to eq true
    end
  end
end

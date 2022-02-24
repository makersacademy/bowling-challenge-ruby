require 'game'

describe Game do
  subject { described_class.new(frame_class)}
  let(:frame) { instance_double(Frame, 'frame', add_roll: nil, over?: false) }
  let(:frame_class) { class_double(Frame, 'Frame', new: frame) }


  describe 'score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe 'current_frame' do
    it 'holds an instance of frame' do
      expect(subject.current_frame).to be frame
    end

    it 'becomes a new frame after frame is over' do
      allow(frame).to receive(:over?).and_return(true)
      expect(frame_class).to receive(:new).twice
      subject.add_roll(3)
    end
  end

  

  describe 'add_roll' do
    it 'adds roll to current frame score' do
      expect(frame).to receive(:add_roll).with(1)
      subject.add_roll(1)
    end

    context 'when frame is not over' do
      it 'does not add current frame to frames' do
        subject.add_roll(3)
        expect(subject.frames).to be_empty
      end
    end

    context 'when frame is over' do
      it 'adds current frame to frames' do
        allow(frame).to receive(:over?).and_return(true)
        subject.add_roll(3)
        expect(subject.frames.last).to be frame
      end
    end
  end
end

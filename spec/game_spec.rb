describe Game do
  subject { described_class.new(frame_class) }
  let(:frame) { instance_double(Frame, 'frame', add_roll: nil, over?: false) }
  let(:frame_class) { class_double(Frame, 'Frame', new: frame) }

  describe '#score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe '#current_frame' do
    it 'holds an instance of frame' do
      expect(subject.current_frame).to be frame
    end

    it 'becomes a new frame after frame is over' do
      allow(frame).to receive(:over?).and_return(true)
      expect(frame_class).to receive(:new).twice
      subject.add_roll(3)
    end
  end

  describe '#add_roll' do
    it 'adds roll to current frame' do
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

    context 'adding spare bonus' do
      it 'adds the score of first role to the last frame bonus' do
        allow(frame).to receive_messages(:spare? => true, roll2: nil)
        subject.frames << frame

        expect(frame).to receive(:add_bonus).once.with(5)
        subject.add_roll(5)
      end

      it 'does not add the score of second roll to bonus' do
        allow(frame).to receive_messages(:spare? => true, roll2: nil)
        subject.frames << frame

        expect(frame).to receive(:add_bonus).once.with(5)
        subject.add_roll(5)

        allow(frame).to receive(:roll2).and_return(5)
        subject.add_roll(5)
      end
    end
  end
end

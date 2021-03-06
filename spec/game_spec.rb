describe Game do
  subject { described_class.new(frame_class) }
  let(:frame) { instance_double(Frame, :frame, add_roll: nil, over?: false) }
  let(:frame_class) { class_double(Frame, :frame_class, new: frame) }

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
      let(:spare) { instance_double(Frame, :spare, spare?: true, strike?: false) }

      it 'adds the next roll to the last frame bonus' do
        expect(spare).to receive(:add_bonus).once.with(5)
        subject.frames << spare

        allow(frame).to receive(:rolls).and_return([5])
        subject.add_roll(5)
      end

      it 'does not add the score of second roll' do
        expect(spare).to receive(:add_bonus).once.with(5)
        subject.frames << spare

        allow(frame).to receive(:rolls).and_return([5])
        subject.add_roll(5)

        allow(frame).to receive(:rolls).and_return([5, 5])
        subject.add_roll(5)
      end
    end

    context 'adding strike bonus' do
      let(:strike1) { instance_double(Frame, :strike1, strike?: true, spare?: false) }
      let(:strike2) { instance_double(Frame, :strike2, strike?: true, spare?: false, rolls: [10]) }

      it 'adds the next 2 rolls to the bonus' do
        expect(strike1).to receive(:add_bonus).twice.with(5)
        subject.frames << strike1

        allow(frame).to receive(:rolls).and_return([5])
        subject.add_roll(5)

        allow(frame).to receive(:rolls).and_return([5, 5])
        subject.add_roll(5)
      end

      context 'player gets 3 strikes in a row' do
        it 'adds both following strikes to bonus' do
          expect(strike1).to receive(:add_bonus).twice.with(10)
          expect(strike2).to receive(:add_bonus).once.with(10)
          allow(frame).to receive(:rolls).and_return([10])

          subject.frames << strike1
          subject.add_roll(10)

          subject.frames << strike2
          subject.add_roll(10)
        end
      end
    end
  end
end

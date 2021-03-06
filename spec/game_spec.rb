describe Game do
  let(:frame) { instance_double(Frame, 'frame', add_roll: nil) }
  let(:frame_class) { class_double(Frame, 'Frame', new: frame) }

  subject { described_class.new(frame_class) }

  describe '#score' do
    it 'starts at zero' do
      expect(subject.score).to be_zero
    end
  end

  describe 'current_frame' do
    it 'holds an instance of frame' do
      expect(subject.current_frame).to be frame
    end
  end

  describe 'add_roll' do
    it 'adds roll score to current frame score' do
      expect(frame).to receive(:add_roll).with(1)
      subject.add_roll(1)
    end
  end
end

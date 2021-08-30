require 'game'

describe Game do

  let(:frame) { double :frame }
  let(:frame_class) { class_double(Frame).as_stubbed_const(:transfer_nested_constants => true) }
  let(:first_frame) { frame_class::FIRST_FRAME }
  let(:last_frame) { frame_class::LAST_FRAME }

  before(:each) do
    (first_frame..last_frame).each do |id|
      expect(frame_class).to receive(:new).with(id) { frame }
    end
    allow(frame).to receive(:add)
    allow(frame).to receive(:full?)
    subject { described_class.new }
  end

  describe '#roll' do

    it 'invokes add method' do
      expect(frame).to receive(:add).with(7)
      subject.roll(7)
    end

    it 'increments frame if frame full' do
      allow(frame).to receive(:full?).and_return(false, true)
      expect { subject.roll(10) }.to change { subject.current_frame }.by(1)
    end
      
    it 'raises error if game complete' do
      first_frame.upto(last_frame - 1) do 
        allow(frame).to receive(:full?).and_return(false, true)
        subject.roll(1)
      end
      allow(frame).to receive("full?").and_return(true)
      expect { subject.roll(1) }.to raise_error 'Game complete'
    end

    describe '#scorecard'

    it 'retrieves frame data from each frame' do
      first_frame.upto(last_frame) do
        expect(frame).to receive(:frame_id)
        expect(frame).to receive(:roll_1)
        expect(frame).to receive(:roll_2)
        expect(frame).to receive(:roll_3)
      end
      subject.scorecard
    end

    it 'generates a string' do
      allow(frame).to receive(:frame_id)
      allow(frame).to receive(:roll_1)
      allow(frame).to receive(:roll_2)
      allow(frame).to receive(:roll_3)
      expect(subject.scorecard).to be_a String
    end
  end
end

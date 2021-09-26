require 'frame'

describe Frame do
  let(:frame) { described_class.new }
  context 'upon initialization' do
    it 'frame_score and both roll values are nil' do
      expect(frame.roll_1).to be nil
      expect(frame.roll_2).to be nil
      expect(frame.frame_score).to be nil
    end

    it 'strike and spare are set to false' do
      expect(frame.strike?).to eq false
      expect(frame.spare?).to eq false
    end
  end

  describe '#bowl' do
    it 'calling #bowl once assigns @roll_1' do
      allow(frame).to receive(:gets).and_return("5")
      frame.bowl
      expect(frame.roll_1).to eq 5
    end

    it 'calling #bowl a second time assigns @roll_2' do
      allow(frame).to receive(:gets).and_return("5", "3")
      frame.bowl
      frame.bowl
      expect(frame.roll_2).to eq 3
    end

    it 'changes @strike to true if @roll_1 equals 10' do
      allow(frame).to receive(:gets).and_return("10")
      frame.bowl
      expect(frame.strike?).to eq true
    end

    it 'changes @spare to true if @roll_1 + @roll_2 equals 10' do
      allow(frame).to receive(:gets).and_return("5", "5")
      frame.bowl
      frame.bowl
      expect(frame.spare?).to eq true
    end

    it 'finishes the frame once bowling is finished' do
      allow(frame).to receive(:gets).and_return("5", "3")
      frame.bowl
      frame.bowl
      expect(frame.frame_finished).to eq true
      expect(frame.bowl).to eq "This frame has finished"
    end
  end

  describe '#calculate_frame_score' do
    it 'sums roll_1 and roll_2 when no strike/spare bonus' do
      allow(frame).to receive(:gets).and_return("5", "3")
      frame.bowl
      frame.bowl
      expect(frame.calculate_frame_score).to eq 8
    end
  end

  describe '#end_of_frame_message' do
    it 'returns a message with your scoring at the end of the frame' do
      allow(frame).to receive(:gets).and_return("5", "3")
      frame.bowl
      expect(frame.bowl).to eq "You scored 8 points this frame."
    end
  end
end

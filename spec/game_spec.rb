require 'game'

describe Game do

  describe '#add' do
    it 'adds number of pins knocked down' do
      expect { subject.add(3) }.to change { subject.throws.size }.by(1)
    end
  end

  describe '#frame_state' do
    it 'Calls frame_state' do
      expect(subject).to receive(:frame_state)
      subject.add(3)
    end
  end

end
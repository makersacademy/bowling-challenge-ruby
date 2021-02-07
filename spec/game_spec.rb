require 'game'

describe Game do

  let(:score) { double 'score', calculate: 'calculate' }
  subject { Game.new(score) }

  describe '#initialize' do
    it 'calls calculate on scorer' do
      expect(score).to receive(:calculate)
      subject.add(10)
    end
  end

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

  describe '#frame_finished?' do
    it 'returns true if total frame is less than 10' do
      subject.add(3)
      subject.add(4)
      expect(subject.frame_finished?).to be true
    end

    it 'returns false if not frame_finished' do
      subject.add(3)
      expect(subject.frame_finished?).to be false
    end

    it 'returns true if a strike' do
      subject.add(10)
      expect(subject.frame_finished?).to be true
    end
  end

end
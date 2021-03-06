require 'frame'

describe Frame do
  subject { described_class.new(number: 1) }

  # let(:throw_1) { double(:bowl, :pins => 6) }
  # let(:throw_2) { double(:bowl, :pins => 3) }

  let(:bowl_double) { double(:bowl, :pins => 4) }
  let(:bowl_class_double) { double(:bowl_class, :new => :bowl_double) }

  describe '#number' do
    it 'stores the frame number' do
      expect(subject.number).to eq 1
    end
  end

  describe '#add' do
    it 'adds a bowl to the frame' do
      subject.add(pins: 4)

      expect(subject.bowls.length).to eq 1
      expect(subject.score).to eq 4
    end
  end

  describe '#bowls' do
    it 'stores the bowls from the frame' do
      subject.add(pins: 4)
      subject.add(pins: 4)

      expect(subject.bowls).to be_a Array
      expect(subject.bowls.length).to eq 2
      expect(subject.score).to eq 8
    end
  end
end
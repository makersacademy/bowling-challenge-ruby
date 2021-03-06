# frozen_string_literal: true

require 'frame'

# refactor at end to test behaviour, not state

describe Frame do
  subject { described_class.new(number: 1) }

  let(:bowl) { double(:bowl, pins: 4) }

  describe '#number' do
    it 'stores the frame number' do
      expect(subject.number).to eq 1
    end
  end

  describe '#add' do
    it 'adds a bowl to the frame' do
      subject.add(bowl: bowl)

      expect(subject.bowls.length).to eq 1
      expect(subject.pins).to eq 4
    end
  end

  describe '#bowls' do
    it 'stores the bowls from the frame' do
      subject.add(bowl: bowl)
      subject.add(bowl: bowl)

      expect(subject.bowls).to be_a Array
      expect(subject.bowls.length).to eq 2
      expect(subject.pins).to eq 8
    end
  end
end

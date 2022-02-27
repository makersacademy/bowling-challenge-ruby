# frozen_string_literal: true

require 'frame'

# refactor at end to test behaviour, not state

describe Frame do
  subject { described_class.new(number: 1, score_table: {}) }

  let(:bowl) { double(:bowl, pins: 4) }
  let(:strike) { double(:bowl, pins: 10) }

  describe '#number' do
    it 'stores the frame number' do
      expect(subject.number).to eq 1
    end
  end

  describe '#add' do
    it 'adds a bowl to the frame' do
      subject.add(bowl: bowl)

      expect(subject.bowls.length).to eq 1
      expect(subject.pins_total).to eq 4
    end
  end

  describe '#bowls' do
    it 'stores the bowls from the frame' do
      2.times { subject.add(bowl: bowl) }

      expect(subject.bowls).to be_a Array
      expect(subject.bowls.length).to eq 2
      expect(subject.pins_total).to eq 8
    end
  end

  describe '#score' do
    let(:score_double) { double(:framescore, score: 8) }
    let(:score_class_double) { double(:score_class, new: score_double) }

    it 'displays the score for the frame' do
      2.times { subject.add(bowl: bowl) }
      subject.push_score

      expect(subject.score.total).to eq 8
    end
  end
end

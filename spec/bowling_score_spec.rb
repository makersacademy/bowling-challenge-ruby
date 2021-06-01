# frozen_string_literal: true

require 'bowling_score'

describe BowlingScore do
  describe '#roll' do
    it 'saves a gutter game' do
      20.times { subject.roll(0) }
      expect(subject.total_score).to eq 0
    end

    it 'saves a strike' do
      subject.roll(10)
      subject.roll(5)
      subject.roll(3)
      16.times { subject.roll(0) }
      expect(subject.total_score).to eq 26
    end

    it 'saves a spare' do
      subject.roll(3)
      subject.roll(7)
      subject.roll(5)
      17.times { subject.roll(0) }
      expect(subject.total_score).to eq 20
    end
  end
end

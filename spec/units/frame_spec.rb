# frozen_string_literal: true

require 'frame'

describe Frame do
  subject { described_class.new(1) }
  describe 'keeping track of progress' do
    it 'knows its number' do
      # subject.add_roll(2)
      expect(subject.number).to be 1
    end
  end

  context 'rolls 1-9' do
    it 'closes after two rolls' do
      expect(subject.open).to be true
      subject.add_roll(2)
      subject.add_roll(7)
      expect(subject.open).to be false
    end

    it 'closes after a strike' do
      subject.add_roll(10)
      expect(subject.open).to be false
    end

    it 'raises an error if adding roll to closed frame' do
      subject.add_roll(2)
      subject.add_roll(7)
      expect { subject.add_roll(2) }.to raise_error 'Frame is closed.'
    end
  end

  context 'roll ten' do
    it 'allows third roll if strike' do
      frame_ten = described_class.new(10)
      expect(frame_ten.number).to eq 10
      frame_ten.add_roll(10)
      expect(frame_ten.open).to be true
      frame_ten.add_roll(10)
      expect(frame_ten.open).to be true
      frame_ten.add_roll(10)
      expect(frame_ten.open).to be false
    end

    it 'allows third roll if spare' do
      frame_ten = described_class.new(10)
      frame_ten.add_roll(8)
      expect(frame_ten.open).to be true
      frame_ten.add_roll(2)
      expect(frame_ten.open).to be true
      frame_ten.add_roll(10)
      expect(frame_ten.open).to be false
    end

    it "doesn't normally allow third roll" do
      frame_ten = described_class.new(10)
      expect(frame_ten.number).to eq 10
      frame_ten.add_roll(2)
      expect(frame_ten.open).to be true
      frame_ten.add_roll(3)
      expect(frame_ten.open).to be false
    end

    it "doesn't count pins after strike - only bonuses" do
      frame_ten = described_class.new(10)
      frame_ten.add_roll(10)
      frame_ten.add_roll(8)
      expect(frame_ten.rolls.sum).to eq 10
    end
  end


end

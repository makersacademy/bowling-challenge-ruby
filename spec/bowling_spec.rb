require 'bowling'

describe Bowling do
  context '.initialize' do
    it 'initializes with an empty rolls array' do
      expect(subject.rolls).to eq []
    end
  end

  context '.frame' do
    it 'pushes first and second roll into the rolls array' do
      subject.frame(2, 3)
      expect(subject.rolls[0]).to eq({:first=>2, :second=>3})
    end

    it 'records a strike' do
      subject.frame(10)
      expect(subject.rolls[0]).to eq({:first=>10})
    end
  end

end

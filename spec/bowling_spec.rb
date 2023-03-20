require_relative '../lib/bowling'

RSpec.describe Bowling do
  
  def roll_multiple(count, pins)
    count.times { subject.roll(pins) }
  end

  context '#score' do
    it 'can score a gutter game' do
      roll_multiple(20, 0)
      expect(subject.score).to eq(0)
    end

    it 'can score a game of all ones' do
      roll_multiple(20, 1)
      expect(subject.score).to eq(20)
    end

    it 'can score a game of mixed rolls without spares and strikes' do
      roll_multiple(5, 1)
      roll_multiple(5, 2)
      roll_multiple(5, 3)
      roll_multiple(5, 4)
      expect(subject.score).to eq(50)
    end

    it 'can score a game with one spare' do
      subject.roll(4)
      subject.roll(6)
      subject.roll(7)
      roll_multiple(17, 0)
      expect(subject.score).to eq(24)
    end

    it 'can score a game with one strike' do
      subject.roll(10)
      subject.roll(6)
      subject.roll(3)
      subject.roll(2)
      roll_multiple(16, 0)
      expect(subject.score).to eq(30)
    end

    it 'can score a perfect game' do
      roll_multiple(12, 10)
      expect(subject.score).to eq(300)
    end
  end
end
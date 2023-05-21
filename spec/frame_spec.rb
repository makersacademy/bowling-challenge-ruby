require 'frame'

RSpec.describe Frame do
  context 'when initialized with two zeros' do
    it 'has those scores' do
      frame = Frame.new(0, 0)
      expect(frame.scores).to eq [0, 0]
    end

    it 'is not a strike' do
      frame = Frame.new(0, 0)
      expect(frame.strike?).to eq false
    end

    it 'is not a spare' do
      frame = Frame.new(0, 0)
      expect(frame.spare?).to eq false
    end
  end

  context 'when initialised with two numbers that add up to 9' do
    it 'has those scores' do
      frame = Frame.new(4, 5)
      expect(frame.scores).to eq [4, 5]
    end

    it 'is not a strike' do
      frame = Frame.new(4, 5)
      expect(frame.strike?).to eq false
    end

    it 'is not a spare' do
      frame = Frame.new(4, 5)
      expect(frame.spare?).to eq false
    end
  end

  context 'when initialised with two numbers that add up to 10' do
    it 'is a spare' do
      frame = Frame.new(2, 8)
      expect(frame.spare?).to eq true
    end
  end

  context 'when initialised with another two numbers that add up to 10' do
    it 'is also a spare' do
      frame = Frame.new(9, 1)
      expect(frame.spare?).to eq true
    end
  end

  context 'when initialised with 10' do
    it 'has that score' do
      frame = Frame.new(10)
      expect(frame.scores).to eq [10]
    end

    it 'is a strike' do
      frame = Frame.new(10)
      expect(frame.strike?).to eq true
    end

    it 'is not a spare' do
      frame = Frame.new(10)
      expect(frame.spare?).to eq false
    end
  end
end
require 'game' 

describe Game do 
  it 'tracks rolls' do
    expect(subject.rolls).to eq []
  end

  it 'allows for up to 12 rolls' do
    expect(subject.rolls.length).to be >= 0
    expect(subject.rolls.length).to be <= 12
  end

  it 'knows if the game is finished' do
    expect(subject.finished).to eq false
  end

  describe '#rolls' do
    it 'adds the roll to game rolls' do
      subject.roll(1)
      expect(subject.rolls).to eq [1]
      subject.roll(2)
      expect(subject.rolls).to eq [1, 2]
    end
  end

  describe '#finished?' do
    it 'checks if the game is finished' do
      expect(subject.finished?).to eq false
    end
  end
end

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
    it 'returns if the game is finished' do
      expect(subject.finished?).to eq false
    end

    context 'strike on 10th frame' do
      it 'returns false after 11 rolls' do
        10.times { subject.roll(10) }
        subject.roll(10)
        expect(subject.finished?).to eq false
      end
      it 'returns true after 12 rolls' do
        10.times { subject.roll(10) }
        subject.roll(10)
        subject.roll(1)
        expect(subject.finished?).to eq true
      end
    end

    context 'not a strike on 10th frame' do
      it 'returns true after 11 rolls' do
        9.times { subject.roll(10) }
        subject.roll(9)
        subject.roll(1)
        p subject.rolls

        expect(subject.finished?).to eq true
      end
    end
  end
end

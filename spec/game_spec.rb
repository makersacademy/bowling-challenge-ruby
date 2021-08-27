require 'game' 

describe Game do 
  it 'tracks the total score' do
    expect(subject.total_score).to be >= 0
    expect(subject.total_score).to be <= 300
  end

  it 'tracks the frames' do
    expect(subject.frames.length).to be >= 0
    expect(subject.frames.length).to be <= 10
  end

  context 'given a roll' do
    it 'tracks the roll' do
      subject.roll(1)
      expect(subject.rolls.last).to eq 1
    end

    it 'opens a new frame unless last frame is still open' do
      subject.roll(1) 
      expect(subject.frames.length).to eq 1
    end
  end
end

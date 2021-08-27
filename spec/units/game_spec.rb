require 'game' 

describe Game do 
  it 'tracks the current frame' do
    expect(subject.frame).to eq 1
  end

  it 'tracks frames up to 10' do
    expect(subject.frame).to be <= 10
  end

  describe '#score' do
    it 'tracks the game score' do
      expect(subject.score).to eq 0
    end
  end
end

require 'game' 

describe Game do 
  it 'tracks the current frame' do
    expect(subject.frame).to eq 1
  end

  it 'tracks frames up to 10' do
    expect(subject.frame).to be <= 10
  end

  it 'tracks frame scores' do
    expect(subject.frame_scores).to eq []
  end

  describe '#score' do
    it 'tracks the game score' do
      expect(subject.score).to eq 0
    end
  end

  describe '#roll' do
    it 'takes the number of pins the user knocked down' do
      expect(subject).to respond_to(:roll).with(1).argument
    end
  end
end

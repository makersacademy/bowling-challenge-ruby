require 'game' 

describe Game do 
  it 'tracks the game score' do
    expect(subject.score).to eq 0
  end

  it 'tracks the current frame' do
    expect(subject.frame).to eq 1
  end

  it 'tracks frames up to 10' do
    expect(subject.frame).to be <= 10
  end

  it 'tracks frame results' do 
    expect(subject.frame_results).to eq []
  end

  it 'tracks frame scores' do
    expect(subject.frame_scores).to eq []
  end

  describe '#roll' do
    it 'takes the number of pins the user knocked down' do
      expect(subject).to respond_to(:roll).with(1).argument
    end

    context 'user knocks 10 pins' do
      it 'should record a strike' do
        subject.roll(10)
        expect(subject.frame_results.last).to eq 'X'
      end
    end

    context 'user rolls a split' do
      it 'should record a split' do
        subject.roll(7)
        subject.roll(3)
        expect(subject.frame_results.last).to eq [7, '/']
      end
    end
  end

  describe '#gameover?' do
    it 'returns if game is over' do
      expect(subject.gameover?).to eq false
    end
  end
end

require 'game'

describe Game do

  it 'can respond to score' do
    expect(subject).to respond_to(:score)
  end

  it 'can return score of O if all fail' do
    20.times{ subject.roll(0) }
    expect(subject.score).to eq 0
  end

  it 'can return score of 20 without strike or spare' do
    20.times{ subject.roll(1) }
    expect(subject.score).to eq 20
  end

  it 'return a spare' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(4)
    expect(subject.score).to eq 18
  end

end

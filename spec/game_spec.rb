require 'game'

describe Game do

  it 'can respond to score' do
    expect(subject).to respond_to(:score)
  end

  it 'can return score of O' do
    20.times{subject.rolls(0)}
    expect(subject.score).to eq 0
  end

  it 'can return score of 20' do
    20.times{subject.rolls(1)}
    expect(subject.score).to eq 20
  end

end

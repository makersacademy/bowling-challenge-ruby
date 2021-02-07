require 'game'

describe Game do

  it 'can respond to score' do
    expect(subject).to respond_to(:score).with(1).argument
  end

  it 'can return score of O' do
    expect(subject.score(20)).to eq 0
  end

end

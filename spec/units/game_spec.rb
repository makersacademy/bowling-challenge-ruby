require 'game' 

describe Game do 
  it 'tracks rolls' do
    expect(subject.rolls).to eq []
  end

  it 'allows for up to 12 rolls' do
    expect(subject.rolls.length).to be >= 0
    expect(subject.rolls.length).to be <= 12
  end
end

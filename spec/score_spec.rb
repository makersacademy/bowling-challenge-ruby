require 'score'

describe Score do
  it 'accepts a numeric roll' do 
    expect(subject.first_roll(pins: 5)).to eq(5)
  end

  it 'accepts a second numeric roll' do
    expect(subject.second_roll(pins: 5)).to eq(5)
  end
end
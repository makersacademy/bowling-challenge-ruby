require 'score'

describe Score do
  it 'accepts a numeric roll' do 
    expect(subject.roll(pins: 5)).to eq(5)
  end
end
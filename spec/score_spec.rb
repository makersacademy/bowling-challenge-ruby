require 'score'

describe Score do
  it 'accepts a numeric roll' do 
    expect(subject.first_roll(pins: 5)).to eq(5)
  end

  it 'accepts a second numeric roll' do
    expect(subject.second_roll(pins: 5)).to eq(5)
  end

  it 'initalizes with scores and strikes set to nil' do
    expect(subject.first_roll_pins).to eq(nil)
    expect(subject.second_roll_pins).to eq(nil)
    expect(subject.spare).to eq(false)
    expect(subject.strike).to eq(false)
  end
end
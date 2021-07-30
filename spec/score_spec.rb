require 'score'

describe Score do
  it 'accepts a numeric roll' do 
    subject.first_roll(pins: 5)
    expect(subject.first_roll_pins).to eq(5)
  end

  it 'accepts a second numeric roll' do
    subject.first_roll(pins: 5)
    subject.second_roll(pins: 5)
    expect(subject.second_roll_pins).to eq(5)
  end

  it 'initalizes with scores and strikes set to nil' do
    expect(subject.first_roll_pins).to eq(nil)
    expect(subject.second_roll_pins).to eq(nil)
    expect(subject.spare).to eq(false)
    expect(subject.strike).to eq(false)
  end

  it 'scoring 10 in first round sets strike to true' do
    subject.first_roll(pins: 10)
    expect(subject.strike).to eq(true)
  end

  it 'scoring 10 across two rounds sets spare to true' do
    subject.first_roll(pins: 5)
    subject.second_roll(pins: 5)
    expect(subject.spare).to eq(true)
  end
end
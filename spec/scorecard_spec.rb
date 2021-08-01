require 'scorecard'

describe Scorecard do 
  it 'player can input a number' do
    subject.roll_input(5)
    expect(subject.score). to eq 5
  end

  it 'player can receive sum of multiple inputs' do
    subject.roll_input(5)
    expect(subject.score). to eq 5
    subject.roll_input(4)
    expect(subject.score). to eq 9
    subject.roll_input(3)
    expect(subject.score). to eq 12
    subject.roll_input(2)
    expect(subject.score). to eq 14
  end

  it 'player roll scores are stored in frames' do
    subject.roll_input(5)
    subject.roll_input(4)
    expect(subject.frame). to eq({roll1: 5, roll2: 4})
  end

  it 'roll count is reset every 2 normal rolls' do
    subject.roll_input(5)
    subject.roll_input(4)
    expect(subject.roll_count). to eq(0)
  end

  it 'frame count goes up every 2 normal rolls' do
    subject.roll_input(5)
    subject.roll_input(4)
    expect(subject.frame_count). to eq(1)
  end
end
require 'game'

describe Game do

  it 'should be able to input a roll' do
    subject.input_roll(1)
    expect(subject.current_frame.rolls).to match_array [1]
  end

  it 'should be able to keep track of frames' do
    subject.input_roll(1)
    subject.input_roll(2)
    subject.input_roll(3)
    subject.input_roll(4)
    expect(subject.frames.length).to eq 2
    expect(subject.frames[0].rolls).to match_array [1,2]
    expect(subject.frames[1].rolls).to match_array [3,4]
  end

  it 'should be able to score two vanilla rounds' do
    subject.input_roll(1)
    subject.input_roll(2)
    subject.input_roll(3)
    subject.input_roll(4)
    expect(subject.total_score).to eq 10
  end

  it 'should be able to add a spare bonus (not last frame)' do
    subject.input_roll(1)
    subject.input_roll(9)
    subject.input_roll(1)
    subject.input_roll(1)
    expect(subject.total_score).to eq 13
  end

  it 'should be able to add a strike bonus (not last frame, next frame vanilla)' do
    subject.input_roll(10)
    subject.input_roll(1)
    subject.input_roll(1)
    expect(subject.total_score).to eq 14
  end

  it 'should be able to add a strike bonus (not last frame, next frame strike)' do
    subject.input_roll(10)
    subject.input_roll(10)
    subject.input_roll(1)
    subject.input_roll(1)
    expect(subject.total_score).to eq 36
  end

end
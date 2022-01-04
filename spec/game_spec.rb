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
    expect(subject.total_score).to eq 35
  end

  it 'can play six rounds and score correctly' do
    subject.input_roll(1)
    subject.input_roll(4)
    subject.input_roll(4)
    subject.input_roll(5)
    subject.input_roll(6)
    subject.input_roll(4)
    subject.input_roll(5)
    subject.input_roll(5)
    subject.input_roll(10)
    subject.input_roll(0)
    subject.input_roll(1)
    expect(subject.total_score).to eq 61
  end

  it 'can play 10 rounds (vanilla last round) and score correctly' do
    subject.input_roll(1)
    subject.input_roll(4)

    subject.input_roll(4)
    subject.input_roll(5)

    subject.input_roll(6)
    subject.input_roll(4)

    subject.input_roll(5)
    subject.input_roll(5)

    subject.input_roll(10)

    subject.input_roll(0)
    subject.input_roll(1)

    subject.input_roll(7)
    subject.input_roll(3)

    subject.input_roll(6)
    subject.input_roll(4)

    subject.input_roll(10)

    subject.input_roll(2)
    subject.input_roll(7)

    expect(subject.total_score).to eq 125
  end

  it 'gives an extra roll for a spare in the final frame' do
    18.times{
      subject.input_roll(0)
    }
    subject.input_roll(1)
    subject.input_roll(9)
    subject.input_roll(1)
    expect(subject.frames.length).to eq 10
  end

  it 'gives an extra roll for a strike in the final frame' do
    18.times{
      subject.input_roll(0)
    }
    subject.input_roll(10)
    subject.input_roll(1)
    subject.input_roll(1)
    expect(subject.frames.length).to eq 10
  end

  it 'can calculate a 10th round spare bonus' do
    18.times{
      subject.input_roll(0)
    }
    subject.input_roll(1)
    subject.input_roll(9)
    subject.input_roll(1)
    expect(subject.total_score).to eq 11
  end

  it 'can play 10 frames and score correctly (last frame spare)' do
    subject.input_roll(1)
    subject.input_roll(4)
    subject.input_roll(4)
    subject.input_roll(5)
    subject.input_roll(6)
    subject.input_roll(4)
    subject.input_roll(5)
    subject.input_roll(5)
    subject.input_roll(10)
    subject.input_roll(0)
    subject.input_roll(1)
    subject.input_roll(7)
    subject.input_roll(3)
    subject.input_roll(6)
    subject.input_roll(4)
    subject.input_roll(10)
    subject.input_roll(2)
    subject.input_roll(8)
    subject.input_roll(6)
    expect(subject.total_score).to eq 133
  end

  it 'can correctly calculate an all-strikes except for last round' do
    9.times {
      subject.input_roll(10)
    }
    subject.input_roll(0)
    subject.input_roll(0)
    expect(subject.total_score).to eq 240
  end

  it 'can score a perfect game correctly' do
    12.times {
      subject.input_roll(10)
    }
    expect(subject.total_score).to eq 300
  end

end
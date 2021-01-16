require 'scoreboard'


describe Scoreboard do
  it 'can create an instance of scoreboard' do
    expect(subject).to be_kind_of(Scoreboard)
  end

  it 'should be able to roll a game of 0s (gutter game)' do
    scoreboard = Scoreboard.new
    10.times do scoreboard.add_frame([0, 0])
    end
    expect(scoreboard.score).to eq 0
  end

  it 'should be able to roll a game of 1s' do
    scoreboard = Scoreboard.new
    10.times do scoreboard.add_frame([1, 1])
    end
    expect(scoreboard.score).to eq 20
  end

  it 'should be able to roll a game of 2s' do
    scoreboard = Scoreboard.new
    10.times do scoreboard.add_frame([2, 2])
    end
    expect(scoreboard.score).to eq 40
  end

  it 'should be able to calculate a spare' do
    scoreboard = Scoreboard.new
    scoreboard.add_frame([9, 1])
    scoreboard.add_frame([1, 0])
    expect(scoreboard.score).to eq 12
  end

  it 'should be able to calculate a spare with a different combination' do
    scoreboard = Scoreboard.new
    scoreboard.add_frame([8, 2])
    scoreboard.add_frame([4, 0])
    expect(scoreboard.score).to eq 18
  end

  it 'should be able to calculate a strike' do
    scoreboard = Scoreboard.new
    scoreboard.add_frame([10, 0])
    scoreboard.add_frame([1, 1])
    expect(scoreboard.score).to eq 14
  end
end

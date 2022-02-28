require 'scoreboard'
require 'frame'

describe 'test_scorecards' do
  it 'should calculate the sum of a standard frame' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(7)
    scoreboard.single_roll(1)
    expect(scoreboard.score).to eq 8
  end

  it 'should return 0 if the first frame is not completed' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(4)
    expect(scoreboard.score).to eq 0
  end

  it 'should return 0 if the any future frame is not completed' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(4)
    scoreboard.single_roll(5)
    scoreboard.single_roll(9)
    expect(scoreboard.score).to eq 0
  end

  it 'should return a total when multiple frame scores are entered' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(1)
    scoreboard.single_roll(7)
    scoreboard.single_roll(2)
    scoreboard.single_roll(7)
    expect(scoreboard.score).to eq 17
  end

  it 'should add the following 2 throws to a strike' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(10)
    scoreboard.single_roll(1)
    scoreboard.single_roll(3)
    expect(scoreboard.score).to eq 18
  end

  it 'should add the following throw to a spare' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(9)
    scoreboard.single_roll(1)
    scoreboard.single_roll(3)
    scoreboard.single_roll(3)
    expect(scoreboard.score).to eq 19
  end

  it 'should return 300 for a perfect game' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    expect(scoreboard.score).to eq 300
  end

  it 'should tally 3 throws in final game if a spare hit' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(9)
    scoreboard.single_roll(1)
    scoreboard.single_roll(10)
    expect(scoreboard.score).to eq 279
  end

  it 'should tally 2 throws in final game if no spare or strike hit' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(6)
    scoreboard.single_roll(1)
    expect(scoreboard.score).to eq 260
  end

  it 'should return an error if you input an extra throw to a perfect game' do
    scoreboard = Scoreboard.new
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    scoreboard.single_roll(10)
    expect { scoreboard.single_roll(10) }.to raise_error("you have attempted to add too many throws")
  end
end
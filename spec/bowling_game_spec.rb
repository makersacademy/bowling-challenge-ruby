require 'rspec'
require 'bowling_game'

describe 'Bowling Game Behaviour' do 

  it 'can roll gutter game' do
    game = BowlingGame.new
    20.times{game.roll 0}
    expect(game.score).to eq 0
  end

  it 'can roll all ones' do 
    game = BowlingGame.new
    20.times{game.roll 1}
    expect(game.score).to eq 20
  end 

  it 'can roll a spare' do 
    game = BowlingGame.new
    game.roll 5
    game.roll 5
    game.roll 3
    17.times{ game.roll 0 }
    expect(game.score).to eq 16
  end

  it 'can roll a strike' do 
    game = BowlingGame.new
    game.roll 10
    game.roll 5
    game.roll 5
    17.times{ game.roll 0 }
    expect(game.score).to eq 30
  end

  it 'can play 10 frames only' do 
    game = BowlingGame.new
    20.times{ game.roll 4 }
    expect { game.roll 5 }.to raise_error(RuntimeError)
  end

  it 'can calculate a roll_count' do 
    game = BowlingGame.new
    20.times{ game.roll 0 }
    expect(game.roll_count).to eq 20
  end
  it 'calculates the correct number of rolls given a strike' do 
    game = BowlingGame.new
    18.times{ game.roll 0 }
    game.roll 10
    expect(game.roll_count).to eq 20
  end
end
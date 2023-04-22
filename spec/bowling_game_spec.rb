require 'bowling_game'

describe BowlingGame do
  # reafctoring: to avoid initializing 'game' via BowlingGame.new, we can call it with @ via:

  before do
    @game = BowlingGame.new
  end

  context 'creates and plays a bowling game with 1 player' do
    it 'creates game' do
      @game # initializes game/class
    end
  end

  it 'rolls a gutter game, 20 rolls with no pins knocked over' do
    20.times { @game.roll 0 }
    expect(@game.score).to eq 0
  end

  it 'can roll and knock just 1 pin 20 times' do
    20.times { @game.roll 1 }
    expect(@game.score).to eq 20
  end

  it 'add two rolls in a frame if under 10 pins' do
    @game.roll 1
    @game.roll 4
    18.times { @game.roll 0 }
    expect(@game.score).to eq 5
  end

  it 'can roll a spare' do
    @game.roll 6
    @game.roll 4
    @game.roll 5
    17.times { @game.roll 0 }
    expect(@game.score).to eq 20
  end

  it 'can roll a strike' do
    @game.roll 10
    @game.roll 2
    @game.roll 3
    16.times { @game.roll 0 }
    expect(@game.score).to eq 20
  end

  it 'can roll a perfect game' do 
    12.times { @game.roll 10}
    expect(@game.score).to eq 300
end

it 'creates the example score of the exercise' do
    @game.roll 1
    @game.roll 4
    @game.roll 4
    @game.roll 5
    @game.roll 6
    @game.roll 4
    @game.roll 5
    @game.roll 5
    @game.roll 10
    @game.roll 0
    @game.roll 1
    @game.roll 7
    @game.roll 3
    @game.roll 6
    @game.roll 4
    @game.roll 10
    @game.roll 2
    @game.roll 8
    @game.roll 6
    expect(@game.score).to eq 133
end
end

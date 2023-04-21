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
    game = BowlingGame.new
    20.times { @game.roll 0 }
    expect(@game.score).to eq 0
  end

  it 'can roll and knock just 1 pin 20 times' do
    game = BowlingGame.new
    20.times { @game.roll 1 }
    expect(@game.score).to eq 20
  end
end

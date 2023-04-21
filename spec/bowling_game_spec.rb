require 'bowling_game'

describe BowlingGame do
    
    context 'creates and plays a bowling game with 1 player' do
        it 'creates game' do
            game = BowlingGame.new #initializes game/class
        end
    end
 
it 'rolls a gutter game, 20 rolls with no pins knocked over' do
    game = BowlingGame.new
    20.times{game.roll 0}
    expect(game.score).to eq 0
end

end
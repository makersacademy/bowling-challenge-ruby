require_relative '../lib/bowling_game'

describe 'the behaviour of the game' do 
    it "creates a bowling game" do
    game = BowlingGame.new
  end

    it "can roll a gutter game" do
        game = BowlingGame.new
        20.times{game.roll 0}
        expect(game.score).to eq 0
  end
    
    it 'can roll all 1s' do
        game = BowlingGame.new
        20.times{game.roll 1}
        expect(game.score).to eq 20

    end
    
end



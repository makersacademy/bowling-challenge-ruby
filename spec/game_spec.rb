require 'game'

describe Game do
    

    it 'will create a new game' do
        game = Game.new
        expect(game).to be_kind_of Game
    end

    it 'will contain a scorecard' do
        game = Game.new
        expect(game.scorecard).to eq []
    end
end
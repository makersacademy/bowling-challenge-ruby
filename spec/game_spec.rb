require 'game'

describe Game do

    it 'will create a new Game' do
        game = Game.new
        expect(game).to be_kind_of Game
    end

    it 'will respond to roll with 2 arguments' do
        game = Game.new
        expect(game).to respond_to(:roll).with(2).arguments
    end

    it 'will add two rolls to the scorecard' do
        game = Game.new
        game.roll(3, 4)
        expect(game.scorecard).to eq [3, 4, 7]
    end

    it 'will add totals of multiple rounds' do
        game = Game.new
        game.roll(3, 4)
        game.roll(9, 0)
        game.roll(6, 2)
        expect(game.scorecard).to eq [3, 4, 7, 9, 0, 16, 6, 2, 24]
    end

    it 'will add a / everytime there is a spare' do
        game = Game.new
        game.roll(6, 4)
        expect(game.scorecard).to eq [6, 4, 10]
    end
        
    it 'will add the correct bonus the round following a spare' do
        game = Game.new
        game.roll(6, 4)
        game.roll(5, 2)
        expect(game.scorecard).to eq [6, 4, 10, 5, 2, 22]
    end

    it 'will add the correct bonus the round following a spare' do
        game = Game.new
        game.roll(6, 4)
        game.roll(5, 2)
        game.roll(7, 1)
        game.roll(8, 2)
        game.roll(5, 2)
        expect(game.scorecard).to eq [6, 4, 10, 5, 2, 22, 7, 1, 30, 8, 2, 40, 5, 2, 52]
    end

    it 'will add the correct bonus for a strike' do
        game = Game.new
        game.roll(4, 4)
        game.roll(10, 0)
        game.roll(5, 3)
        expect(game.scorecard).to eq [4, 4, 8, 10, 0, 18, 5, 3, 34]
    end

    it 'will be able to cope with consecutive spares' do
        game = Game.new
        game.roll(5, 5)
        game.roll(6, 4)
        game.roll(4, 3)
        expect(game.scorecard).to eq [5, 5, 10, 6, 4, 26, 4, 3, 37]
    end
    
    it 'will be able to cope with consecutive strikes' do
        game = Game.new
        game.roll(10, 0)
        game.roll(10, 0)
        game.roll(4, 3)
        expect(game.scorecard).to eq [10, 0, 10, 10, 0, 30, 4, 3, 44]
    end

    it 'will return a message if both rolls go in the gutter' do
        game = Game.new
        game.roll(5, 4)
        expect(game.roll(0, 0)).to eq 'Double gutter! Bad luck!'
    end

    it 'will end when the tenth round ends' do
        game = Game.new
        game.roll(6, 4)
        game.roll(5, 2)
        game.roll(7, 1)
        game.roll(8, 2)
        game.roll(5, 2)
        game.roll(7, 1)
        game.roll(6, 3)
        game.roll(8, 2)
        game.roll(6, 3)
        game.roll(2, 2)
        expect(game.roll(3, 1)).to eq 'Game Over!'
    end

    it 'will allow 2 more rolls if a strike of spare is scored in the tenth round' do
        game = Game.new
        game.roll(6, 4)
        game.roll(5, 2)
        game.roll(7, 1)
        game.roll(8, 2)
        game.roll(5, 2)
        game.roll(7, 1)
        game.roll(6, 3)
        game.roll(8, 2)
        game.roll(6, 3)
        game.roll(10, 0)
        game.roll(10, 0)
        game.roll(10, 0)
        expect(game.scorecard).to eq [6, 4, 10, 5, 2, 22, 7, 1, 30, 8, 2, 40, 5, 2, 52, 7, 1, 60, 6, 3, 69, 8, 2, 79, 6, 3, 94, 10, 0, 104, 10, 0, 124, 10, 0, 144]
        
    end
end
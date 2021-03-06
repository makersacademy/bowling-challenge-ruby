require 'bowling_game'

describe BowlingGame do

    it 'should start with a score of 0' do
        new_game = BowlingGame.new
        expect(new_game.score).to be_empty
    end

    it 'should start on zero frames' do
    new_game = BowlingGame.new
    expect(new_game.frame).to eq 0
    end

end

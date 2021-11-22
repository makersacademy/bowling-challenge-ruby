
require 'bowling'

describe Bowling do 
    let(:bowl) { Bowling.new } 

    it 'returns a value when a ball is thrown' do
        score = bowl.test_points
        expect(score).to eq 10
    end

    it 'sarts with a score of 0' do
        bowl = (Bowling::STARTINGSCORE)
        expect(bowl).to eq 0
    end

    it 'Gives massage perfect game' do
        score = 300
        expect(bowl.perfect_game).to eq "PERFECT GAME!!!"
    end

    it 'Gives Gutterball message' do
        score = 0
        expect(bowl.gutter_game).to eq "BAD LUCK!!!"
    end

    it 'returns Spare!' do 
        ball1 = 4 
        ball2 = 6
        expect(bowl.spare).to eq "Spare!"
    end
end
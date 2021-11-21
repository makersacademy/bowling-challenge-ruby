
require 'bowling'

describe Bowling do 
    let (:bowl) { Bowling.new }

    it 'returns a value when a ball is thrown' do
        bowl.test_points
        expect(bowl.score).to eq [10, 0]
    end

    it 'sarts with a score of 0' do
        bowl = (Bowling::STARTINGSCORE)
        expect(bowl).to eq 0
    end

    it "Gives massage you scored a strike" do
     expect(subject.strike).to raise "You Scored A Strike!"
    end

    it 'Gives Gutterball message' do
        score = 0
        expect(bowl.gutter_game).to eq "BAD LUCK!!!"
    end
end
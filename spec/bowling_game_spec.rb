require 'bowling_game'

describe BowlingGame do

    it 'should start with a score of 0' do
        expect(subject.score).to be_empty
    end

    it 'should start on zero frames' do
       expect(subject.frame).to eq 0
    end

    it 'has 2 rolls in each frame' do
        expect(subject).to respond_to(:new_frame).with(2).arguments
    end


end

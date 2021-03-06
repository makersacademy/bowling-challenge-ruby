require 'bowling_game'

describe BowlingGame do

    it 'should start with a score of 0' do
        expect(subject.score).to be_empty
    end

    it 'should start on zero frames' do
       expect(subject.frame).to eq 0
    end

    describe '.new_frame' do

    it 'has 2 rolls in each frame' do
        expect(subject).to respond_to(:new_frame).with(2).arguments
    end

    it 'should increment increment frame by one each new frame' do
    subject.new_frame(1,2)
    subject.new_frame(4,5)
    expect(subject.frame).to eq 2
    end


end

end

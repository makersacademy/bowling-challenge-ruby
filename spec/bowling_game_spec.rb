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

        it 'should increment frame by one each new frame' do
            subject.new_frame(1,2)
            subject.new_frame(4,5)
            expect(subject.frame).to eq 2
        end

        it 'should raise an error if you try to play more than 10 frames without rolling a 10 in the 10th frame' do
            10.times {subject.new_frame(2,2)}
            expect {subject.new_frame(1,2)}.to raise_error("Game Over, you have played all your frames")
        end

        it 'should allow you to play an 11th frame if you roll a 10 in your 10th frame' do
            9.times {subject.new_frame(2,2)}
            subject.new_frame(10, 2)
            subject.new_frame(2,2)
            expect(subject.score.length).to eq 11
        end

    

    end

    it 'should add the score of the current frame to the previous frame if the previous frame was a strike' do
        subject.new_frame(10,0)
        p subject.score[0]
        subject.new_frame(3,4)
        p subject.score[0]
        expect(subject.score[0]).to eq [10, 0, [3, 4]]
        expect(subject.score[1]).to eq [3, 4]
    end

    it 'should add the first roll from the current frame to the previous frame if the previous frame was a spare' do

    




     it 'should add each roll to the score' do
    subject.new_frame(10,2)
    expect(subject.score.length).to eq 1
    end

end

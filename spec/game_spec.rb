require './lib/game.rb'

describe Game  do

    describe 'score' do
        it 'adds the scores of different rolls, and returns a score' do
        subject.roll(1)
        subject.roll(2)
        expect(subject.score).to eq 3
        end
    end

    describe 'end game'  do
        it 'ends the game after 3 rolls, and retruns the final score' do
            ((Game::FRAME_MAX * 2) - 1).times{subject.roll(1)}
            
        expect(subject.roll(1)).to eq "The game is finished - you scored 6 points"
        end

        it 'errors if any further rolls are attempted' do
            (Game::FRAME_MAX * 2).times{subject.roll(1)}
        expect{ subject.roll(4) }.to raise_error 'This game is over'
        end
    end

    describe 'frame scoring' do
        it 'accepts inputs in pairs and generates scores in frames' do
            subject.roll(1)
            expect(subject.roll(2)).to eq 'Your score after frame 1 is 3'
            expect(subject.frame_counter).to eq 1
        end
    end

    describe 'strike identifying' do
        it 'changes the frame number as soon as a 10 is rolled' do
            subject.roll(1)
            subject.roll(1)
            subject.roll(10)
            expect(subject.frame_counter).to eq 2
        end
    end

end
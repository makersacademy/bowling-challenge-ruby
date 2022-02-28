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
        it 'ends the game after max rolls, and returns the final score' do
            ((Game::FRAME_MAX * 2) - 1).times{subject.roll(1)}
            
             expect(subject.roll(1)).to eq "The game is finished - you scored 20 points"
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

    describe 'strike identifier' do
        it 'changes the frame number as soon as a 10 is rolled' do
            subject.roll(1)
            subject.roll(1)
            subject.roll(10)
            expect(subject.frame_counter).to eq 2
        end

        it 'it identifies a strike' do
            subject.roll(1)
            subject.roll(1)
            expect(subject.roll(10)).to eq 'Strike! Your score after frame 2 is 2'
        end

    end

    describe 'spare identifying' do
        it 'identifies a spare' do
            subject.roll(1)
            subject.roll(1)
            subject.roll(5)
            expect(subject.roll(5)).to eq  'Spare! Your score after frame 2 is 2'
        end
    end

    describe 'spare bonus' do
        it 'adds the correct bonus when a spare is scored' do
            subject.roll(1)
            subject.roll(1)
            subject.roll(5)
            subject.roll(5)
            subject.roll(5)
            subject.roll(0)
            expect(subject.score).to eq 22
        end
    end

    describe 'strike bonus' do
        it 'adds the correct bonus when a strike is scored' do
            subject.roll(1)
            subject.roll(1)
            subject.roll(10)
            subject.roll(1)
            subject.roll(1)
            expect(subject.score).to eq 16
        end

        it 'handles consecutive strikes with the correct bonus' do
            subject.roll(10)
            subject.roll(10)
            subject.roll(10)
            subject.roll(0)
            subject.roll(9)
            expect(subject.score).to eq 78
        end
    end

    describe 'final frame bonus'  do
        it 'gives a bonus roll on final frame if a spare' do
            ((Game::FRAME_MAX * 2) - 2).times{subject.roll(1)}
            subject.roll(1)
            subject.roll(9)
        expect(subject.roll(1)).to eq "The game is finished - you scored 29 points"
        end

        it 'give a two bonus roll on final frame if a strike' do
            ((Game::FRAME_MAX * 2) - 2).times{subject.roll(1)}
            subject.roll(10)
            subject.roll(10)
            expect(subject.roll(10)).to eq "The game is finished - you scored 48 points"
        end
    end

    describe 'a perfect game' do
      it 'returns a finishing message and 300 when a perfect game is bowled' do
        11.times{subject.roll(10)}

        expect(subject.roll(10)).to eq "The game is finished - you scored 300 points"
        end
    end
end
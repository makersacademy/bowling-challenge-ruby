require 'frame'

describe Frame do

    it 'knows what was rolled' do
        subject.roll(3)
        subject.roll(3)
        expect(subject.score).to eq 6 
    end

    describe '#score' do
        it 'return the current frame score' do
            expect(subject.score).to eq 0
        end
    end 

    describe 'completed?' do
        it 'knows when the frame has been fully played' do
            subject.roll(3)
            subject.roll(5)
            expect(subject.completed?).to be true
        end
        it 'knows when the frame has been fully played' do
            subject.roll(3)
            expect(subject.completed?).to be false
        end
        it 'knows when the frame has been fully played' do
            subject.roll(10)
            expect(subject.completed?).to be true
        end
    end

    describe '#strike' do
        it 'knows when a roll is a strike' do
            subject.roll(10)
            expect(subject.strike?).to be true
        end
        it 'knows when a roll is a strike' do
            subject.roll(6)
            expect(subject.strike?).to be false
        end
        it 'knows when a roll is a strike' do
            subject.roll(3)
            subject.roll(6)
            expect(subject.strike?).to be false
        end
    end

    describe 'spare?' do
        it 'knows whe a roll is a spare' do
            subject.roll(10)
            expect(subject.spare?).to be false
        end 
        it 'knows whe a roll is a spare' do
            subject.roll(3)
            subject.roll(3)
            expect(subject.spare?).to be false
        end 
        it 'knows whe a roll is a spare' do
            subject.roll(3)
            subject.roll(7)
            expect(subject.spare?).to be true
        end 
    end

end 
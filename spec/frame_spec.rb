require './lib/frame'

describe Frame do 

    describe '#initialize' do 
        
        it 'should initialize with an empty frame score' do 
            expect(subject.frame_score).to eq 0 
        end

        it 'should initialize with an empty roll_1' do 
            expect(subject.roll_1).to eq 0 
        end

        it 'should initialize with an empty roll_2' do 
            expect(subject.roll_2).to eq 0 
        end

    end 

    describe '#add_roll_1' do 

        it 'should add a score to roll_1' do 
            subject.add_roll_1(5)
            expect(subject.roll_1).to eq 5
        end

    end

    describe '#add_roll_2' do 

        it 'should add a score to roll_1' do 
            subject.add_roll_2(5)
            expect(subject.roll_2).to eq 5
        end

    end

    describe '#strike?' do 

        it 'should check if a strike has been rolled' do
            subject.add_roll_1(10)
            expect(subject.strike?).to eq true
        end

    end

    describe '#spare?' do 

        it 'should check if a spare has been rolled' do
            subject.add_roll_1(5)
            subject.add_roll_2(5)
            expect(subject.spare?).to eq true
        end

    end

    describe '#end_frame' do 

        it 'should update the score at the end of the frame' do 
            subject.add_roll_1(3)
            subject.add_roll_2(4)
            subject.end_frame
            expect(subject.frame_score).to eq 7
        end

    end

end


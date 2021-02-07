require './lib/scorecard'

describe Scorecard do 

    describe '#initialize' do 

        it 'should initialize with a total score of 0' do 
            expect(subject.total_score).to eq 0 
        end

        it 'should initialize with an array with 1 game' do 
            expect(subject.frames.length).to eq 1
        end

    end

    describe '#add_frame' do 

        it 'should add a frame to the frames array' do 
            frame_1 = Frame.new 
            subject.add_frame(frame_1)
            expect(subject.frames.length).to eq 2
        end

    end

end
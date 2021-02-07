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

    describe '#check_for_strike' do 
        
        it 'should check a frame to see whether it is a strike or not' do 
            frame_1 = Frame.new
            frame_1.add_roll_1(10)
            frame_1.end_frame
            subject.add_frame(frame_1)
            expect(subject.check_for_strike).to eq true 
        end

    end

    describe '#check_for_spare' do 
        
        it 'should check a frame to see whether it is a strike or not' do 
            frame_1 = Frame.new
            frame_1.add_roll_1(5)
            frame_1.add_roll_2(5)
            frame_1.end_frame
            subject.add_frame(frame_1)
            expect(subject.check_for_spare).to eq true 
        end

    end

    describe '#update_score' do 

        it 'should update the total score with newly added frame scores' do 
            frame_1 = Frame.new
            frame_1.add_roll_1(4)
            frame_1.add_roll_2(5)
            frame_1.end_frame
            subject.add_frame(frame_1)
            subject.update_score
            expect(subject.total_score).to eq 9
        end

    end

end

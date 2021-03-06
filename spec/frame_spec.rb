require 'frame'

describe Frame do
    describe '#score' do
        it 'return the current frame score' do
            subject { Frame.new }
            expect(subject.score).to eq 0
        end
    end 
    describe '#add' do
        it 'adds throws to the frame - example 1' do
            subject { Frame.new }
            subject.add(3)
            subject.add(5)
            expect(subject.score).to eq 8
        end
        it 'adds throws to the frame - example 2' do
            subject { Frame.new }
            subject.add(5)
            subject.add(4)
            expect(subject.score).to eq 9
        end
        it 'adds throws to the frame - strike' do
            subject { Frame.new }
            subject.add(10)
            expect(subject.score).to eq 10
        end
    end
end 
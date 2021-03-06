require 'game'

describe Game do
    describe '#score' do
        it 'knows the current game score' do
            subject { Game.new }
            expect(subject.score).to eq 0
        end
        it 'knows the current game score - after playing one frame' do
            subject { Game.new }
            frame_one = instance_double('Frame', :score => 8)
            
            subject.add(frame_one.score)
            
            expect(subject.score).to eq 8
        end
        it 'knows the current game score - after playing two frame' do
            subject { Game.new }
            frame_one = instance_double('Frame', :score => 8)
            frame_two = instance_double('Frame', :score => 5)
            
            subject.add(frame_one.score)
            subject.add(frame_two.score)
            
            expect(subject.score).to eq 13
        end
    end
end
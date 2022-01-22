require 'frame'

describe Frame do 
    describe '#save_rolls' do
        it 'stores the rolls within an array' do
            expect(subject).to respond_to(:save_rolls)
        end 
    end 
end 
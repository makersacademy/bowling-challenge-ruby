require 'frame'

describe Frame do 
    describe '#save_rolls' do
        it 'stores the rolls within an array' do
            expect(subject).to respond_to(:save_rolls)
        end 
        
        it 'stores the frame number and the roll results' do
            test_frame = Frame.new
            expect(test_frame).to include(:roll_number => 1, :roll_1 => 2, :roll_2 => 5)
        end 
    end 
end 
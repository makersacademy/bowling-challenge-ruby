require 'frame'

describe Frame do 
    describe '#save_rolls' do
        it 'stores the rolls within an array' do
            expect(subject).to respond_to(:save_input)
        end 
        
        it 'stores the frame number and the roll results' do
            frame_test = Frame.new
            expect(frame_test.save_input).to include('frame_number' => 1, 'roll_1' => 2, 'roll_2' => 5)
        end 
    end 
end
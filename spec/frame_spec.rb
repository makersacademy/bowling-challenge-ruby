require 'frame'


describe Frame do

    subject(:frame) { described_class.new}
    
    describe 'new_frame' do
        it 'sets up the next frame' do

            frame = Frame.new_frame(10)
            expect(frame).to include 10
        end
    end

    describe 'last_frame?' do
        it 'checks if it is the end of the 10th frame' do
            frame.frame_number == 10
            expect(frame.last_frame?).to eq true
        end
    end
 end
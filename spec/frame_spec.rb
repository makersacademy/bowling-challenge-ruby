require 'frame'


describe Frame do

    subject(:frame) { described_class.new}
    
    describe 'new_frame' do
        it 'sets up the next frame with 10 pins' do

            frame = Frame.new_frame(10)
            expect(frame).to include 10
        end
    end

    describe 'end_game' do
        it 'ends the game if number of frames is equal to 10' do
            frame
            frame.last_frame? == true
            expect(frame.end_game).to eq "Game over you scored score"
        end
    end

    describe '#last_frame?' do
        it 'checks if it is the end of the 10th frame' do
            frame.frame_number.length == Frame::FRAME_LIMIT
            expect(frame.last_frame?).to eq true
        end
    end
 end
require 'frame'


describe Frame do

    let(:frame) { Frame.new }
    let(:frame_setup) { Frame.new_frame(Frame::PIN_COUNT) }
    let(:strike_roll) { frame.bowl(10) }
    let(:spare_roll) { frame.bowl(6, 4) }
    let(:open_roll) { frame.bowl(1, 4) }
    
    describe '#new_frame' do
        it 'sets up the next frame with 10 pins' do
            #round = Frame.new_frame(Frame::PIN_COUNT)

            expect(frame_setup).to include Frame::PIN_COUNT
        end
    end

    describe '#end_game' do
        it 'ends the game if number of frames is equal to 10' do
            frame_setup
            frame.frame_number[Frame::FRAME_LIMIT]
            frame.last_frame? == true

            expect(frame.end_game).to eq "Game over you scored score"
        end
    end

    describe '#last_frame?' do
        it 'checks if it is the end of the 10th frame' do
            frame.frame_number[Frame::FRAME_LIMIT]

            expect(frame.last_frame?).to eq true
        end
    end

    describe '#bowl' do
        it 'appends the number of pins knocked down in each shot' do
            frame_setup
            frame.bowl(5)
            frame.bowl(3)

            expect(frame.bowl).to eq 8
        end
    end

    describe '#strike?' do
        it 'returns true if first shot knocked down all the pins' do
            frame_setup
            strike_roll

            expect(strike_roll.strike?).to be true
        end

        it 'returns false if first shot does not knock down all the pins' do
            frame_setup
            
            expect(strike_roll.strike?).to eq false
            expect(spare_roll.strike?).to eq false
            expect(open_roll.strike?).to eq false
        end
    end

    describe '#spare?' do
        it 'returns true if the first and second shot = 10' do
            frame_setup
            spare_roll

            expect(spare_roll.spare?).to eq true
        end
    end

    describe '#played?' do
       it 'returns true for strikes, spares and open frames' do
         
            expect(strike_roll.strike?).to eq true
            expect(spare_roll.strike?).to eq true
            expect(open_roll.strike?).to eq true
        end
    end
 end
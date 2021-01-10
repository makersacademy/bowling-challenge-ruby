require 'frame'

describe Frame do

    it 'will create a new frame' do
        frame_1 = Frame.new
        expect(frame_1).to be_kind_of Frame
    end

    it 'will respond to roll with 2 arguments' do
        frame_1 = Frame.new
        expect(frame_1).to respond_to(:roll).with(2).arguments
    end
    

end
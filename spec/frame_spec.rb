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

    it 'will add two rolls to the scorecard' do
        frame_1 = Frame.new
        frame_1.roll(3, 4)
        expect(frame_1.scorecard).to eq [3, 4, 7]
    end

    it 'will add totals of multiple rounds' do
        frame_1 = Frame.new
        frame_1.roll(3, 4)
        frame_1.roll(9, 0)
        frame_1.roll(6, 2)
        expect(frame_1.scorecard).to eq [3, 4, 7, 9, 0, 16, 6, 2, 24]
    end

    it 'will add a / everytime there is a spare' do
        frame_1 = Frame.new
        frame_1.roll(6, 4)
        expect(frame_1.scorecard).to eq [6, 4, 10]
    end
        
    it 'will add the correct bonus the round following a spare' do
        frame_1 = Frame.new
        frame_1.roll(6, 4)
        frame_1.roll(5, 2)
        expect(frame_1.scorecard).to eq [6, 4, 10, 5, 2, 22]
    end

    it 'will add the correct bonus the round following a spare' do
        frame_1 = Frame.new
        frame_1.roll(6, 4)
        frame_1.roll(5, 2)
        frame_1.roll(7, 1)
        frame_1.roll(8, 2)
        frame_1.roll(5, 2)
        expect(frame_1.scorecard).to eq [6, 4, 10, 5, 2, 22, 7, 1, 30, 8, 2, 40, 5, 2, 52]
    end

    it 'will add the correct bonus for a strike' do
        frame_1 = Frame.new
        frame_1.roll(4, 4)
        frame_1.roll(10, 0)
        frame_1.roll(5, 3)
        expect(frame_1.scorecard).to eq [4, 4, 8, 10, 0, 18, 5, 3, 34]
    end

    it 'will be able to cope with consecutive spares' do
        frame_1 = Frame.new
        frame_1.roll(5, 5)
        frame_1.roll(6, 4)
        frame_1.roll(4, 3)
        expect(frame_1.scorecard).to eq [5, 5, 10, 6, 4, 26, 4, 3, 37]
    end
    
    it 'will be able to cope with consecutive strikes' do
        frame_1 = Frame.new
        frame_1.roll(10, 0)
        frame_1.roll(10, 0)
        frame_1.roll(4, 3)
        expect(frame_1.scorecard).to eq [10, 0, 10, 10, 0, 30, 4, 3, 44]
    end

    it 'will return a message if both rolls go in the gutter' do
        frame_1 = Frame.new
        frame_1.roll(5, 4)
        expect(frame_1.roll(0, 0)).to eq 'Double gutter! Bad luck!'
    end
end
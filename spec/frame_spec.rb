require 'frame'

describe Frame do
    subject(:frame) { described_class.new(1) }

    it 'knows what the frame number is' do
        expect(frame.number).to eq(1)
    end

    it 'adds a roll' do
        frame.add_roll(3)
        expect(frame.rolls.last).to eq(3)
    end

    it 'knows when the frame is finished' do
        frame.add_roll(3)
        frame.add_roll(3)
        expect(frame).to be_finished
    end

end
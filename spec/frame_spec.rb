require 'frame'

describe Frame do
    subject(:frame) { described_class.new(1) }

    it 'knows what the frame number is' do
        expect(frame.number).to eq(1)
    end

end
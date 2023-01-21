require 'frame'

describe Frame do
    context 'creates a new frame' do
        it 'returns pins knocked as an array' do
            frame = Frame.new(0, 0)
            expect(frame.pins_knocked).to eq [0, 0]
        end
    end
end
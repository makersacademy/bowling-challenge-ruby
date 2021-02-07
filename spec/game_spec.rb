require 'game'

describe Game do
    subject(:game) { described_class.new }
    let(:frame) { double :frame}
    
    it 'adds a frame' do
        expect { game.add_frame(frame) }.to change { game.frames.length }.by(1)
    end
end
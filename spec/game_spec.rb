require 'game'

describe Game do
    subject(:game) { described_class.new }
    let(:frame) { double :frame}

    it 'adds a frame' do
        expect { game.add_frame(frame) }.to change { game.frames.length }.by(1)
    end

    it 'knows when the game is finished' do
        10.times { || game.add_frame(frame) }
        expect(game).to be_finished
    end
end
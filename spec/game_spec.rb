require './lib/game'
require 'stringio'

describe Game do

  let(:frame) { double :frame }

  let(:game) { described_class.new }

  describe '#play_frame' do

    it 'plays a frame and returns the frames basic score' do
      allow(frame).to receive(:roll).and_return( { remaining_pins: 4 , score: 6 } )
      expect(game.play_frame(frame)).to eq( { first_roll: 6} )
    end

  end

end
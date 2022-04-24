require './lib/game'
require 'stringio'

describe Game do

  let(:frame) { double :frame }

  let(:game) { described_class.new }

  describe '#play_frame' do

    before do
      $stdin = StringIO.new("6")
    end

    after do
      $stdin = STDIN
    end

    it 'plays a frame and returns the frames basic score' do

      allow(frame).to receive(:roll).with("6")
      expect(game.play_frame).to eq( { first_roll: 6} )
    end

  end

end
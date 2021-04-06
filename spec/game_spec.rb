require 'spec_helper'
require 'game'

describe Frame do
  let(:game) { Game.new }

    it 'has frames variable that stores all frames' do
      expect(game.frames).to eq []
    end

    describe '#turn' do
      it 'returns the received frame' do
        game = Game.new
        frame_double = double
        allow(frame_double).to receive(:frame).and_return( { frame_id: 2, first_roll: 6, second_roll: 2 } )
        game.turn(frame_double)
        expect(game.frames).to eq[{ frame_id: 2, first_roll: 6, second_roll: 2 }]
      end
    end
  end
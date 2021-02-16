require './lib/bowling_game'
require './lib/frame'
require 'pry'

describe 'BowlingGame' do
  before do
    @game = BowlingGame.new
  end

  describe '#score' do
    context 'rolls 7 pins' do
      it 'returns 7' do
        @game.roll(7)
        expect(@game.score).to eq(7)
      end
    end

    context 'rolls 7, 2' do
      it 'returns 9' do
        @game.roll(7)
        @game.roll(2)
        expect(@game.score).to eq(9)
      end
    end

    context 'rolls 7, 2, 3' do
      it 'returns 12' do
        @game.roll(7)
        @game.roll(2)
        @game.roll(3)
        expect(@game.score).to eq(12)
      end
    end

    context 'rolls 7, spare, 2, 3' do
      it 'returns 12' do
        @game.roll(7)
        @game.roll(3)
        @game.roll(2)
        @game.roll(3)
        expect(@game.score).to eq(17)
      end
    end

    context 'never hits a pin' do
      it 'scores 0' do
        20.times{ @game.roll(0) }
        expect(@game.score).to eq(0)
      end
    end

    # context 'rolls 12 strikes' do
    #   it 'scores 300' do
    #     12.times{ @game.roll(10) }
    #     expect(@game.score).to eq(300)
    #   end
    # end
  end
end

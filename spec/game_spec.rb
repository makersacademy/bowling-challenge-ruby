require './game'

describe Game do
  describe '.roll' do
    it 'should return the number of pins knocked over' do
      game = Game.new
      expect(game.roll(4)).to eq 4
    end
  end
end

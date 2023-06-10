require 'bowling' 

RSpec.describe Bowling do
  let(:game) { Bowling.new }

  describe '#initialize' do
    it 'creates an empty rolls array' do
      expect(game.instance_variable_get(:@rolls)).to eq([])
    end
  end

  describe '#roll' do
    it 'adds pins to the rolls array' do
      game.roll(4)
      expect(game.instance_variable_get(:@rolls)).to eq([4])
    end
  end

  describe '#score' do
    context 'when all rolls are 0' do
      it 'returns 0 as the score' do
        20.times { game.roll(0) }
        expect(game.score).to eq(0)
      end
    end

    context 'when all rolls knock down 1 pin' do
      it 'returns 20 as the score' do
        20.times { game.roll(1) }
        expect(game.score).to eq(20)
      end
    end

    context 'when there is a spare' do
      it 'calculates the score correctly' do
        game.roll(5)
        game.roll(5)  # Spare
        game.roll(3)
        17.times { game.roll(0) }
        expect(game.score).to eq(16)
      end
    end

    context 'when there is a strike' do
      it 'calculates the score correctly' do
        game.roll(10)  # Strike
        game.roll(3)
        game.roll(4)
        16.times { game.roll(0) }
        expect(game.score).to eq(24)
      end
    end

    context 'when there are consecutive strikes' do
      it 'calculates the score correctly' do
        game.roll(10)  # Strike
        game.roll(10)  # Strike
        game.roll(4)
        game.roll(2)
        14.times { game.roll(0) }
        expect(game.score).to eq(46)
      end
    end
  end
end


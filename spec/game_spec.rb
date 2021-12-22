# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#add_frame' do
    it 'adds a frame consisting of 2 rolls' do
      game.add_rolls(1, 4)
      expect(game.frames).to include([1, 4])
    end

    it 'raises an error if the frame exceedes 10' do
      expect { game.add_rolls(5, 6) }.to raise_error 'Sum of the rolls cannot exceede 10'
    end
  end
end

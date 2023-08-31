# frozen_string_literal: true

require 'bowling'

describe Bowling do
  describe '#play' do
    it 'all strikes scores 300' do
      rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      game = game_with_input(rolls)
      game.play
      expect(game.total_score).to eq 300
    end

    it 'example scores 133' do
      rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
      game = game_with_input(rolls)
      game.play
      expect(game.total_score).to eq 133
    end

    def game_with_input(rolls)
      input = StringIO.new(rolls.join("\n") + "\n")
      Bowling.new(input: input)
    end
  end
end

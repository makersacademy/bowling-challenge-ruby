# frozen_string_literal: true

describe Game do
  describe '#run' do
    let(:game) { Game.new }

    it 'correctly calculates the score for a no strike game' do
      $stdin = UserInput.input([1, 2, 3, 4, 7, 1, 6, 2, 9, 0, 6, 1, 8, 0, 0, 5, 5, 2, 2, 4])
      game.run
      expect(game.total_score).to eq(68)
    end

    it 'correctly calculates the score for a game with strikes and spares but not in the final frame' do
      $stdin = UserInput.input([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 7])
      game.run
      expect(game.total_score).to eq(125)
    end

    it 'correctly calculates the score for a game with a spare on the end' do
      $stdin = UserInput.input([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])
      game.run
      expect(game.total_score).to eq(133)
    end

    it 'correctly calculates the score for a game with a strike on the end followed by two normal rolls' do
      $stdin = UserInput.input([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 10, 5, 3])
      game.run
      expect(game.total_score).to eq(140)
    end

    it 'correctly calculates the score for a game with a strike on the end followed by a spare' do
      $stdin = UserInput.input([1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 10, 5, 5])
      game.run
      expect(game.total_score).to eq(142)
    end

    it 'correctly calculates the score for a game with a twelfth frame' do
      $stdin = UserInput.input([1, 4, 4, 5, 6, 4, 5, 5, 10,  0, 1, 7, 3, 6, 4, 10,  10,  10,  9])
      game.run
      expect(game.total_score).to eq(156)
    end
  end
end

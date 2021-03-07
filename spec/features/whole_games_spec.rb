describe 'playing a whole game' do
  subject(:game) { Game.new }

  let(:example_game1) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }

  context 'game and scoreboard calculate the correct score' do
    it 'calulates 300 for a perfect game' do
      12.times { game.add_roll(10) }
      expect(game.score).to be 300
    end

    it 'calulates 0 for a gutter game' do
      20.times { game.add_roll(0) }
      expect(game.score).to be 0
    end

    it 'calulates 150 when every roll is 5' do
      21.times { game.add_roll(5) }
      expect(game.score).to be 150
    end

    it 'calulates 90 when every frame is 9 and 0' do
      10.times { [9, 0].each { |roll| game.add_roll(roll) } }
      expect(game.score).to be 90
    end

    it 'calculates 133 for this example game' do
      example_game1.each { |roll| game.add_roll(roll) }
      expect(game.score).to be 133
    end
  end
end

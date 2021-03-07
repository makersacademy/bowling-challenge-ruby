describe 'playing a whole game' do
  subject(:game) { Game.new }

  context 'game and scoreboard calculate the correct score and running total' do
    it 'calulates 300 for a perfect game' do
      12.times { game.add_roll(10) }
      expect(game.score).to be 300
      expect(game.score_board.running_total).to eq [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
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

    it 'calculates 133 for example game 1' do
      example_game1 = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
      example_game1.each { |roll| game.add_roll(roll) }

      expect(game.score).to be 133
      expect(game.score_board.running_total).to eq [5, 14, 29, 49, 60, 61, 77, 97, 117, 133]
    end
  end

  it 'calculates 176 for example game 2' do
    example_game2 = [9, 1, 0, 10, 10, 10, 6, 2, 7, 3, 8, 2, 10, 9, 0, 10, 10, 8]
    example_game2.each { |roll| game.add_roll(roll) }

    expect(game.score).to be 176
    expect(game.score_board.running_total).to eq [10, 30, 56, 74, 82, 100, 120, 139, 148, 176]
  end
end

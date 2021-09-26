require 'game'

describe Game do

  describe '.initialize' do
    it 'sets @rolls to an empty array' do
      game = Game.new
      expect(game.rolls).to eq([])
    end
  end

  describe '#score' do
    it 'scores the game as 0 when only gutter balls are thrown' do
      game = Game.new
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end
  end

  # it 'should provide the total score of a frame correctly' do
  #   game.roll(3)
  #   game.roll(6)
  #   expect(game.score).to eq(9)
  # end

  # it 'should provide the total score of a frame correctly' do
  #   game = Game.new(:roll_one, :roll_two)
  #   allow(game).to receive(:roll_one) { 3 }
  #   allow(game).to receive(:roll_two) { 6 }
  #   expect(game.total_of_frame).to eq(9)
  # end

  # it 'should determine when a spare is rolled' do
  #   game = Game.new(6, 4)
  #   expect(game.spare?).to be true
  # end

  # it 'should determine when a strike is rolled' do
  #   game = Game.new(10, 0)
  #   expect(game.strike?).to be true
  # end

  # it 'can calculate a gutter game' do
  #   game = Game.new(:roll_one, :roll_two)
  #   20.times(game.roll(0))
  #   expect(game.score).to eq 0
  # end
end

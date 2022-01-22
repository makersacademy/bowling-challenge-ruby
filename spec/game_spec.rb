require 'bowling_game'

describe BowlingGame do
  describe '.all' do
    before do
      @game = BowlingGame.new
    end
    
    it 'Can roll gutter game' do
      20.times { @game.roll(0) }
      expect(@game.score).to eq (0)
    end

    it 'Can roll all ones' do
      20.times { @game.roll(1) }
      expect(@game.score).to eq (20)
    end

    # it 'can roll spare' do
    #     game.roll(5)
    #     game.roll(5)
    #     game.roll(3)
    #     17.times { game.roll(0) }
    #     expect(game.score) == 16
    #   end

    # it 'all_fives_game_score_should_be_150' do
    #   (1..21).each { game.roll(5) }
    #   expect(game.score) == 150
    # end

    # it 'perfect_game_score_should_be_300' do
    #   (1..12).each { game.roll(10) }
    #   expect(game.score) == 300
    # end

  end
end

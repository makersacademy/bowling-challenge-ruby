require 'BowlingGame'

describe BowlingGame do
  it 'can initialise a game' do
    game = BowlingGame.new
  end

  context 'it can be initialized with 1 argument' do
    it 'receives no argument, the array is an empty array ' do
      game = BowlingGame.new
      expect(game.roll_list).to be_empty
    end

    it 'receives 1 argument' do
      game = BowlingGame.new([1,4,7])
      expect(game.roll_list).to eq [ 1, 4, 7]
    end
  end 

  let(:game) {BowlingGame.new}

  describe '#roll()' do
    it 'stores the number of knocked down pins in an array' do
      game.roll(5)
      expect(game.roll_list[0]).to eq 5
    end
  end

  describe 'roll_list' do
    it 'can store several rolls in an array' do
      game = BowlingGame.new([6, 8, 2])

      expect(game.roll_list[0]).to eq 6
      expect(game.roll_list[1]).to eq 8
      expect(game.roll_list[2]).to eq 2
    end
  end

  describe '#score' do
    it 'can roll a gutter game' do
      20.times{ game.roll(0) }

      expect(game.outcome).to eq 0
    end

    context 'player rolls a spare' do
      it 'calculate the total points' do
        game.roll(2)
        game.roll(8)  # spare
        game.roll(4)  # bonus points from 1st roll of 2nd frame
        game.roll(2)  # 2nd roll for 2nd frame
        16.times{game.roll(0)}  # we test a whole game of 10 frames
        # p game.roll_list => [2, 8, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        expect(game.outcome).to eq (2+8+4+4+2)
      end
    end
  end

end
require './lib/game'

RSpec.describe Game do
  describe 'initialisation' do
    it 'initialises with Frame 1 Roll 1, and total score: 0' do
      game = Game.new
      expect(game.frame).to eq 1
      expect(game.roll).to eq 1
      expect(game.pins_rolled).to eq [[], [], [], [], [], [], [], [], [], []] 
      expect(game.total_score).to eq 0
      expect(game.continue).to eq true
    end
  end

  describe 'taking new input' do
    it 'takes input and changes frame and roll number accordingly (1-1 -> 1-2)' do
      game = Game.new
      game.roll_pin(5)
      expect(game.frame).to eq 1
      expect(game.roll).to eq 2
      expect(game.pins_rolled).to eq [[5], [], [], [], [], [], [], [], [], []] 
    end

    it 'takes input and changes frame and roll number accordingly (1-2 -> 2-1)' do
      game = Game.new
      game.roll_pin(5)
      game.roll_pin(3)
      expect(game.frame).to eq 2
      expect(game.roll).to eq 1
      expect(game.pins_rolled).to eq [[5, 3], [], [], [], [], [], [], [], [], []]
    end

    it 'takes input and changes frame if roll 1 is a strike' do
      game = Game.new
      game.roll_pin(10)
      expect(game.frame).to eq 2
      expect(game.roll).to eq 1
      expect(game.pins_rolled).to eq [[10], [], [], [], [], [], [], [], [], []] 
    end

    it 'takes inputs correctly for multiple rounds' do
      game = Game.new
      game.roll_pin(10)
      expect(game.frame).to eq 2
      expect(game.roll).to eq 1
      game.roll_pin(10)
      expect(game.frame).to eq 3
      expect(game.roll).to eq 1
      game.roll_pin(6)
      expect(game.frame).to eq 3
      expect(game.roll).to eq 2
      game.roll_pin(3)
      expect(game.frame).to eq 4
      expect(game.roll).to eq 1
      expect(game.pins_rolled).to eq [[10], [10], [6, 3], [], [], [], [], [], [], []] 
    end
  end

  describe '10th frame' do
    it 'ends the game when in Frame 10, no strike or spare' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(1)
      game.roll_pin(2)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [1,2]] 
      expect(game.continue).to eq false
    end

    it 'allows the third roll if the 10th frame is a spare' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(1)
      game.roll_pin(9)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [1,9]] 
      expect(game.continue).to eq true
    end

    it 'allows the third roll when the 10th frame has two strikes' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(10)
      game.roll_pin(10)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10]] 
      expect(game.continue).to eq true
    end

    it 'ends the game after three rolls at Frame 10 (case 1)' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(10)
      game.roll_pin(10)
      game.roll_pin(10)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]] 
      expect(game.continue).to eq false
    end

    it 'ends the game after three rolls at Frame 10 (case 2)' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(10)
      game.roll_pin(10)
      game.roll_pin(7)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 7]] 
      expect(game.continue).to eq false
    end

    it 'ends the game after three rolls at Frame 10 (case 3)' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(2)
      game.roll_pin(8)
      game.roll_pin(7)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [2, 8, 7]] 
      expect(game.continue).to eq false
    end

    it 'ends the game after three rolls at Frame 10 (case 4)' do
      game = Game.new
      9.times {game.roll_pin(10) }
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], []] 
      game.roll_pin(2)
      game.roll_pin(8)
      game.roll_pin(10)
      expect(game.pins_rolled).to eq [[10], [10], [10], [10], [10], [10], [10], [10], [10], [2, 8, 10]] 
      expect(game.continue).to eq false
    end
  end

  describe 'calculating scores' do
    it 'starts the game with 0 score' do
      game = Game.new
      expect(game.total_score).to eq 0
    end

    it 'calculates score with no strike and spare' do
      game = Game.new
      game.roll_pin(7)
      game.roll_pin(2)
      game.roll_pin(5)
      game.roll_pin(4)
      expect(game.total_score).to eq 18
    end

    it 'calculates score one spare then open' do
      game = Game.new
      game.roll_pin(7)
      game.roll_pin(3)
      game.roll_pin(5)
      game.roll_pin(4)
      expect(game.total_score).to eq 24
    end

    it 'calculates score one strike then open' do
      game = Game.new
      game.roll_pin(10)
      game.roll_pin(5)
      game.roll_pin(4)
      expect(game.total_score).to eq 28
    end

    it 'calculates score two strikes followed by an open' do
      game = Game.new
      game.roll_pin(10)
      game.roll_pin(10)
      game.roll_pin(7)
      game.roll_pin(2)
      expect(game.total_score).to eq 55
    end

    it 'calculates score a strike followed by a spare, then an open' do
      game = Game.new
      game.roll_pin(10)
      game.roll_pin(7)
      game.roll_pin(3)
      game.roll_pin(5)
      expect(game.total_score).to eq 40
    end

    it 'calculates score a strike followed by a spare, then an open' do
      game = Game.new
      game.roll_pin(10)
      game.roll_pin(7)
      game.roll_pin(3)
      game.roll_pin(5)
      expect(game.total_score).to eq 40
    end

    it 'calculates scores of a sample (up to 9th frame)' do
      game = Game.new
      game.roll_pin(8)
      game.roll_pin(1)
      game.roll_pin(0)
      game.roll_pin(9)
      game.roll_pin(2)
      game.roll_pin(8)
      game.roll_pin(10)
      game.roll_pin(6)
      game.roll_pin(3)
      game.roll_pin(7)
      game.roll_pin(0)
      game.roll_pin(5)
      game.roll_pin(2)
      game.roll_pin(10)
      game.roll_pin(0)
      game.roll_pin(6)
      expect(game.total_score).to eq 102
    end

    it 'calculates scores of a sample (up to 10th frame)' do
      game = Game.new
      game.roll_pin(8)
      game.roll_pin(1)
      game.roll_pin(0)
      game.roll_pin(9)
      game.roll_pin(2)
      game.roll_pin(8)
      game.roll_pin(10)
      game.roll_pin(6)
      game.roll_pin(3)
      game.roll_pin(7)
      game.roll_pin(0)
      game.roll_pin(5)
      game.roll_pin(2)
      game.roll_pin(10)
      game.roll_pin(0)
      game.roll_pin(6)
      game.roll_pin(2)
      game.roll_pin(8)
      game.roll_pin(10)
      expect(game.pins_rolled[9]).to eq [2, 8, 10]
      expect(game.total_score).to eq 122
    end

    it 'calculates scores of gutter game' do
      game = Game.new
      20.times {game.roll_pin(0)}
      expect(game.total_score).to eq 0
    end

    it 'calculates scores for a perfect game' do
      game = Game.new
      9.times {game.roll_pin(10)}
      game.roll_pin(10)
      game.roll_pin(10)
      game.roll_pin(10)
      expect(game.pins_rolled[9]).to eq [10, 10, 10]
      expect(game.total_score).to eq 300
    end
  end
end

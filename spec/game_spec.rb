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

end

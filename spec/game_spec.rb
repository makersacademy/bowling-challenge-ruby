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
end

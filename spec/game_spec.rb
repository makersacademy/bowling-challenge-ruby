require 'game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a new scorecard, current frame, frames array, and roll count' do
      game = Game.new

      expect(game.scorecard).to be_a(Scorecard)
      expect(game.current_frame).to be_a(Frame)
      expect(game.frames).to eq([game.current_frame])
      expect(game.roll_count).to eq(0)
    end
  end

  describe '#roll' do
    it 'adds the roll to the current frame' do
      game = Game.new
      game.roll(3)

      expect(game.current_frame.rolls[0].score).to eq(3)
    end

    it 'updates the scorecard' do
      game = Game.new
      game.roll(5)
      game.roll(1)

      expect(game.scorecard.frames[0].rolls[0].score).to eq(5)
      expect(game.scorecard.frames[0].rolls[1].score).to eq(1)
    end

    it 'updates the roll count' do
      game = Game.new
      game.roll(5)

      expect(game.roll_count).to eq(1)
    end

    it 'creates a new frame if the current frame is full' do
      game = Game.new
      game.roll(5)
      game.roll(5)
      game.roll(5)

      expect(game.current_frame.rolls[0].score).to eq(5)
      expect(game.frames.length).to eq(2)
    end
  end
end
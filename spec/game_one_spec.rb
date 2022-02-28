# frozen_string_literal: true

require 'game_one'

describe GameOne do
  let(:game) { described_class.new }
  describe '#initialize' do
    it 'has an entry for every possible roll of the 21' do
      expect(game.scorecard.count).to eq 21
      expect(game.scorecard[0]).to eq 0
    end
    it 'has a frame count set to 1' do
      expect(game.frame_counter).to eq 1
    end
    it 'has a roll counter that starts at 1' do
      expect(game.roll_counter).to eq 1
    end
    it 'has a frame_total array with 11 positions' do
      expect(game.frames_total.length).to eq 10
    end
    it 'has a bonus array that collects all bonuses and starts identical to frams_total' do
      expect(game.frames_total.length).to eq 10
    end
    it 'has a game total set to 0' do
      expect(game.total).to eq 0
    end
  end
  describe '#roll' do
    it "adds the score to the scorecard at index 'roll_counter - 1'" do
      expect { game.roll(5) }.to change { game.scorecard[0] }.by 5
    end
    it 'adds 1 to the roll_counter' do
      expect { game.roll(5) }.to change { game.roll_counter }.by 1
    end
    it 'adds 1 count extra to the roll_counter if first role of frame is 10' do
      expect {  game.roll(GameOne::STRIKE)}.to change { game.roll_counter }.by 2
    end
    it 'adds the score of the frame to the frames_total if you hit a strike' do
      game.roll(GameOne::STRIKE)
      expect(game.frames_total).to eq [10, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    end
    it 'adds one to the frame count if you get a strike' do
      game.roll(GameOne::STRIKE)
      expect(game.frame_counter).to eq 2
    end
    it 'adds one to the frame counter every second go of frame' do
      game.roll(4)
      game.roll(5)
      expect(game.frame_counter).to eq 2
    end
    it 'adds the score to the score card on second go of frame' do
      game.roll(3)
      expect { game.roll(5) }.to change { game.scorecard.sum }.by 5
    end
    it 'adds bonus points if two strikes in a row happen' do
      game.roll(GameOne::STRIKE)
      game.roll(GameOne::STRIKE)
      game.roll(GameOne::STRIKE)
      expect(game.bonus).to eq [20, 10, 0, 0, 0, 0, 0, 0, 0, 0]
    end
    it 'adds the score to the previous frames bonus index if spare equals true' do
      game.roll(4)
      game.roll(6)
      expect { game.roll(7) }.to change { game.bonus[0] }.by 7
    end
    it 'ends the game at the 20th go if 10th frame is normal' do
      9.times {   game.roll(GameOne::STRIKE) }
      game.roll(2)
      game.roll(3)
      expect(game.total).to eq 252
    end
    it 'returns the correct final score if last frame is a spare' do
      9.times {   game.roll(GameOne::STRIKE) }
      game.roll(2)
      game.roll(8)
      game.roll(5)
      expect(game.total).to eq 267
    end
    it 'returns the correct final score if last frame is a strike' do
      12.times {   game.roll(GameOne::STRIKE) }
      expect(game.total).to eq 300
    end
  end
end

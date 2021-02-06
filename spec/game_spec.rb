# frozen_string_literal: true

describe Game do
  let(:game) { described_class.new }

  describe 'initialize' do
    it 'has three public methods' do
      expect(game).to respond_to(:frame, :score, :bowling_game)
    end

    it 'score is an empty array' do
      expect(game.score).to be_empty
    end

    it 'frame is set to 0' do
      expect(game.frame).to eq(0)
    end
  end

  describe '#roll' do
    it 'takes pins and places them into the score' do
      expect{ game.roll(9) }.to change{ game.score.sum }.by(9)
      expect{ game.roll(6) }.to change { game.score.count}.by(1)

      allow(game).to receive(:score).and_return([9,2,3,1])
      expect(game.score).to eq([9,2,3,1])
      expect(game.score.sum).to eq(15)
      expect(game.score.count).to eq(4)
    end
  end

  describe '#bowling_game?' do

    it 'adds 10 to frames' do
      20.times { game.roll(1) }
      expect{ game.bowling_game }.to change { game.frame}.by(10)
    end

    it 'returns 0 when you play a gutter game' do
      20.times { game.roll(0) }
      expect(game.bowling_game).to eq(0)
    end

    it 'can work out a spare' do
      2.times { game.roll(5) } #10 + 1
      2.times { game.roll(1) } #11 + 2
      2.times { game.roll(5) } #13 + 11
      14.times { game.roll(1) } #24 + 14
      expect(game.bowling_game).to eq(38)
    end
  end
end

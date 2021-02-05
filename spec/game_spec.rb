# frozen_string_literal: true

describe Game do
  let(:game) { described_class.new }

  describe 'initialize' do
    it 'has two attributes score and frame' do
      expect(game).to respond_to(:frame, :score)
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
      game.roll(2)
      game.roll(3)
      game.roll(1)
      expect(game.score).to eq([9,2,3,1])
      expect(game.score.sum).to eq(15)
      expect(game.score.count).to eq(4)
    end
  end
end

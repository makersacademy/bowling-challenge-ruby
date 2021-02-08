# frozen_string_literal: true

describe Game do
  let(:game) { described_class.new }

  describe 'initialize' do
    it 'has 3 public methods' do
      expect(game).to respond_to(:frame, :scores, :score)
    end

    it 'score is an empty array' do
      expect(game.scores).to be_empty
    end

    it 'frame is set to 0' do
      expect(game.frame).to eq(0)
    end

    it 'raises an error if game is the game is over' do
      20.times { game.roll(1) }
      game.score
      expect { game.roll(1) }.to raise_error('Your game is now complete')
    end
  end

  describe '#roll' do
    it 'takes pins and places them into the score' do
      expect { game.roll(9) }.to change { game.scores.sum }.by(9)
      expect { game.roll(6) }.to change { game.scores.count }.by(1)

      allow(game).to receive(:scores).and_return([7, 2, 3, 1])
      expect(game.scores).to eq([7, 2, 3, 1])
      expect(game.scores.sum).to eq(13)
      expect(game.scores.count).to eq(4)
    end
  end

  describe '#score' do
    it 'adds 10 to frames' do
      20.times { game.roll(1) }
      expect { game.score }.to change { game.frame }.by(10)
    end

    it 'returns 0 when you play a gutter game' do
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end

    it 'can work out a spare' do
      2.times { game.roll(5) } # 10 + 1
      2.times { game.roll(1) } # 11 + 2
      2.times { game.roll(5) } # 13 + 11
      14.times { game.roll(1) } # 24 + 14
      expect(game.score).to eq(38)
    end

    it 'can work out a strike' do
      game.roll(10) # 10 + 2
      2.times { game.roll(1) } # 12 + 2
      game.roll(10) # 14 + 10 + 2
      2.times { game.roll(1) } # 26 + 2
      12.times { game.roll(1) } # 28 + 12
      expect(game.score).to eq(40)
    end

    it 'can work out a strike followed by a spare' do
      game.roll(10) # 10 + 2
      2.times { game.roll(1) } # 12 + 2
      game.roll(10) # 14 + 10 + 10
      2.times { game.roll(5) } # 34 + 10 + 1
      12.times { game.roll(1) } # 45 + 12
      expect(game.score).to eq(57)
    end

    it 'perfect game' do
      12.times { game.roll(10) }
      expect(game.score).to eq(300)
    end

    it 'can work out a game of all spares' do
      21.times { game.roll(5) }
      expect(game.score).to eq(150)
    end
  end
end

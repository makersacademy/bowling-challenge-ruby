require 'game'

describe Game do

  subject(:game) { described_class.new }

  describe '#roll' do

    it 'creates frame if is not open and add it to an array' do

      expect { game.roll(1) }.to change { game.frames.length }.by(1)
    end

    it 'creates frame if ist open and add it to an array' do
      game.roll(1)

      expect { game.roll(1) }.to change { game.frames.length }.by(0)
    end

    it 'creates new frame every third roll and add it to an array' do

      2.times { game.roll(1) }

      expect { game.roll(1) }.to change { game.frames.length }.by(1)
    end

    it 'creates new frame after strike in first roll' do

      expect { game.roll(10) }.to change { game.frames.length }.by 1
    end
  end

  it ' raise and error( ends game) when you try add 11th frame when there is no strike or  spare in the 10th frame' do # correct

    20.times { game.roll(1) }

    expect { game.roll(1) }.to raise_error 'last ball'
  end

  it 'adds 11th  bonus frame if in 10th frame there is a strike' do # correct

    18.times { game.roll(1) }
    game.roll(10)

    expect { game.roll(1) }.to change { game.frames.length }.by(1)
  end

  it 'adds 11th bonus frame if in 10th frame there is a spare' do # correct

    18.times { game.roll(1) }
    game.roll(2)
    game.roll(8)

    expect { game.roll(1) }.to change { game.frames.length }.by(1)
  end

  it 'adds 12th  bonus frame if in 11th frame there is a strike' do # correct

    18.times { game.roll(1) }
    game.roll(10)
    game.roll(10)
    game.roll(10)
    expect { game.roll(1) }.to raise_error 'last ball'
  end

  it 'raise and error( ends game) if in 11th frame there is no strike' do # correct

    18.times { game.roll(1) }
    game.roll(2)
    game.roll(8)
    game.roll(1)

    expect { game.roll(1) }.to raise_error 'last ball'
  end

  it 'adds 11th  bonus frame if in 10th frame there is a spare' do # correct

    18.times { game.roll(1) }
    game.roll(2)
    game.roll(8)
    game.roll(10)
    expect { game.roll(1) }.to raise_error 'last ball'
  end

  describe 'current_score' do
    it 'shows currnet score for a game' do
      game.roll(1)

      expect { game.roll(2) }.to change { game.current_score }.by(2)
    end

    it 'add bonus after strike' do
      game.roll(10)
      game.roll(2)

      expect { game.roll(3) }.to change { game.current_score }.by(8)
    end

    it 'add bonus after spare' do
      game.roll(8)
      game.roll(2)

      expect { game.roll(3) }.to change { game.current_score }.by(6)
    end

    it ' perfect game' do
      12.times { game.roll(10) }

      expect(game.current_score).to eq 300
    end
  end
end

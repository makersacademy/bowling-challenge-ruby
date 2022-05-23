require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'registers a perfect game' do
    13.times {game.enter_score(10)}
    expect(game.total_score).to eq 300
  end

  describe '#initialize' do
    it 'initializes with a frame counter' do
      expect(game.frame).to eq 1
    end

    it 'initializes with a score of 0' do
      expect(subject.total_score).to eq 0
    end
  end

  describe '#enter_score' do
    it 'inscreases score by input number' do
      expect { game.enter_score(10) }.to change {game.total_score}.by(10)
    end
    it 'it progresses the game by one frame' do
      expect { game.enter_score(10) }.to change {game.frame}.by(1)
    end
  end

end

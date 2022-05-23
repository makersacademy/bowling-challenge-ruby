require 'bowling'

describe Bowling do
  let(:game) { Bowling.new }

  it 'registers a perfect game' do
    12.times {game.enter_score(10)}
    expect(game.final_score).to eq 300
  end

  it 'registers a gutter game' do
    20.times {game.enter_score(0)}
    expect(game.final_score).to eq 0
  end

  describe '#initialize' do
    it 'initializes with a frame counter' do
      expect(game.frame).to eq 1
    end

    it 'initializes with a score of 0' do
      expect(game.score_card).to eq []
    end

    it 'initializes with a frame_score to keep track of spares' do
      expect(game.frame_pins).to eq 0
    end

    it 'it initializes with a frame attempt counter of 0' do
      expect(game.frame_attempts).to eq 0
    end
  end

  describe '#enter_score' do
    it 'increases score by 30 if strike' do
      game.enter_score(10)
      expect(game.score_card.last).to eq 30
    end
    it 'increases score by 15 if spare' do
      game.enter_score(4)
      game.enter_score(6)
      expect(game.score_card.last).to eq 15
    end
    it 'it progresses the game by one frame if strike' do
      expect { game.enter_score(10) }.to change {game.frame}.by(1)
    end
    it 'progresses the game by one if a spare' do
      2.times{ game.enter_score(5) }
      expect(game.frame).to eq 2
    end
  end

end

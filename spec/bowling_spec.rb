require 'bowling' 

describe Bowling do

  context 'basic rules' do

    game = described_class.new

    it 'totals 9 after a frame of 1 and 4' do
      expect(game.total_score).to eq(0)
      game.roll(1)
      game.roll(4)
      expect(game.total_score).to eq(5)
    end

    it 'calculates spares' do
      game.roll(6)
      game.roll(4)
      game.roll(5)
      game.roll(0)
      expect(game.total_score).to eq(25)
    end

    it 'calculates strikes' do
      game.roll(10)
      game.roll(1)
      game.roll(2)
      expect(game.total_score).to eq(41)
    end
    
    it "won't continue the game after 10 frames" do
      10.times { game.roll(3) } # completing another 5 frames, totalling 10
      expect{ game.roll(3) }.to raise_error "Game Over!"
    end

  end

  context 'full games' do

    it 'calculates a score of 0 for a gutter game' do
      20.times { subject.roll(0) }
      expect(subject.total_score).to eq(0)
    end

    it 'calculates a score of 20 for 20 rolls of 1' do
      20.times { subject.roll(1) }
      expect(subject.total_score).to eq(20)
    end

    it 'calculates a score of 300 for a perfect game' do
      12.times { subject.roll(10) }
      expect(subject.total_score).to eq(300)
    end

    it 'calculates a score of 133' do
      subject.roll(1)
      subject.roll(4)
      subject.roll(4)
      subject.roll(5)
      subject.roll(6)
      subject.roll(4)
      subject.roll(5)
      subject.roll(5)
      subject.roll(10)
      subject.roll(0)
      subject.roll(1)
      subject.roll(7)
      subject.roll(3)
      subject.roll(6)
      subject.roll(4)
      subject.roll(10)
      subject.roll(2)
      subject.roll(8)
      subject.roll(6)
      expect(subject.total_score).to eq(133)
    end

    it 'calculates a score of 122' do
      subject.roll(8)
      subject.roll(1)
      subject.roll(0)
      subject.roll(9)
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      subject.roll(6)
      subject.roll(3)
      subject.roll(7)
      subject.roll(0)
      subject.roll(5)
      subject.roll(2)
      subject.roll(10)
      subject.roll(0)
      subject.roll(6)
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      expect(subject.total_score).to eq(122)
    end

  end

end

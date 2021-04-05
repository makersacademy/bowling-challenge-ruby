require 'bowling'

describe Bowling do
  let(:bowling) { Bowling.new }
  describe 'roll' do
    it 'updates the number of pins knocked down' do
      expect { bowling.roll(5) }.to change { bowling.knocked_down }.by(5)
    end

    it 'changes which roll the player is on, if knocked down less than 10 pins on roll 1' do
      expect{ bowling.roll(5) }.to change{ bowling.first_roll }.from(true).to(false)
    end

    it 'updates the scores hash' do
      bowling.roll(5)
      bowling.roll(4)
      expect(bowling.scores[1].sum).to eq(9)
    end

    it 'updates the score of a spare by adding the next roll to the previous frame' do
      3.times{ bowling.roll(5) }
      expect(bowling.scores[1].sum).to eq(15)
    end

    it 'can update the scores for multiple spares' do
      4.times{ bowling.roll(5) }
      bowling.roll(2)
      bowling.roll(8)
      bowling.roll(5)
      expect(bowling.scores[1].sum).to eq(15)
      expect(bowling.scores[2].sum).to eq(12)
      expect(bowling.scores[3].sum).to eq(15)
    end

    it 'can track scores if spares are not consecutive' do
      4.times{ bowling.roll(5) }
      bowling.roll(5)
      bowling.roll(2)
      2.times{ bowling.roll(5) }
      bowling.roll(9)
      expect(bowling.scores[1].sum).to eq(15)
      expect(bowling.scores[2].sum).to eq(15)
      expect(bowling.scores[3].sum).to eq(7)
      expect(bowling.scores[4].sum).to eq(19)
    end

    it 'updates the frame and keeps turn the same if player scores a strike' do
      bowling.roll(10)
      expect(bowling.frame).to eq(2)
      expect(bowling.first_roll).to eq(true)
      expect(bowling.strikes).to eq([1])
    end

    it 'Bonus score of a strike is updated' do
      bowling.roll(10)
      bowling.roll(3)
      bowling.roll(2)
      expect(bowling.scores[1].sum).to eq(15)
    end

    it 'updates the score if player scores two consequtive strikes' do
      bowling.roll(10)
      bowling.roll(10)
      bowling.roll(5)
      expect(bowling.scores[1].sum).to eq(25)
    end

    it 'updates the score if player scores three consequtive strikes' do
      3.times{ bowling.roll(10) }
      bowling.roll(5)
      expect(bowling.scores[1].sum).to eq(30)
      expect(bowling.scores[2].sum).to eq(25)
    end

    it 'works with four strikes' do
      4.times{ bowling.roll(10) }
      bowling.roll(5)
      expect(bowling.scores[1].sum).to eq(30)
      expect(bowling.scores[2].sum).to eq(30)
      expect(bowling.scores[3].sum).to eq(25)
    end

    it 'works for two strikes in a row then two more later' do
      2.times{ bowling.roll(10) }
      bowling.roll(5)
      bowling.roll(2)
      2.times{ bowling.roll(10) }
      bowling.roll(5)
      bowling.roll(2)
      expect(bowling.scores[1].sum).to eq(25)
      expect(bowling.scores[2].sum).to eq(17)
      expect(bowling.scores[3].sum).to eq(7)
      expect(bowling.scores[4].sum).to eq(25)
      expect(bowling.scores[5].sum).to eq(17)
      expect(bowling.scores[6].sum).to eq(7)
    end

    it 'In the 10th frame player gets extra go if strike on second roll' do
      9.times{ bowling.roll(10) }
      bowling.roll(5)
      bowling.roll(10)
      bowling.roll(3)
      expect(bowling.scores[10].sum).to eq(18)
    end

    it 'In the 10th frame player gets extra go if spare on second roll' do
      9.times{ bowling.roll(10) }
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(3)
      expect(bowling.scores[10].sum).to eq(13)
    end

    it 'In the 10th frame game finishes if no spare or strike on second roll' do
      9.times{ bowling.roll(10) }
      bowling.roll(5)
      expect(bowling.roll(2)).to eq("Game over!")
      expect(bowling.scores[10].sum).to eq(7)
    end

    it 'if spare in 9th, bonus applied from first roll in 10th' do
      8.times{ bowling.roll(10) }
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(5)
      expect(bowling.scores[9].sum).to eq(15)
    end

    it 'A player can score a perfect game' do
      11.times{ bowling.roll(10) }
      expect(bowling.roll(10)).to eq("Game over!")
      bowling.roll(10)
      expect(bowling.scores[8].sum).to eq(30)
      expect(bowling.scores[9].sum).to eq(30)
      expect(bowling.scores[10].sum).to eq(30)
      
    end
  end
  describe 'final_scores' do
    it 'displays the scores at the end of the frame, if no strikes or spares' do
      8.times { bowling.roll(3) }
      expect(bowling.final_scores[1]).to eq([6])
    end
    it 'final score is cumulative' do
      10.times { bowling.roll(3) }
      expect(bowling.final_scores[2]).to eq([12])
    end
    it 'calculates final score of spares' do
      11.times { bowling.roll(5) }
      expect(bowling.final_scores[1]).to eq([15])
      expect(bowling.final_scores[2]).to eq([30])
      expect(bowling.final_scores[3]).to eq([45])
    end
    it 'Player can score a perfect game!' do
      12.times { bowling.roll(10) }
      expect(bowling.final_scores[1]).to eq([30])
      expect(bowling.final_scores[2]).to eq([60])
      expect(bowling.final_scores[7]).to eq([210])
      expect(bowling.final_scores[8]).to eq([240])
      expect(bowling.final_scores[9]).to eq([270])
      expect(bowling.final_scores[10]).to eq([300])
    end
    it 'Player can score a gutter game!' do
      20.times { bowling.roll(0) }
      expect(bowling.final_scores[1]).to eq([0])
      expect(bowling.final_scores[2]).to eq([0])
      expect(bowling.final_scores[3]).to eq([0])
      expect(bowling.final_scores[4]).to eq([0])
      expect(bowling.final_scores[5]).to eq([0])
      expect(bowling.final_scores[6]).to eq([0])
      # expect(bowling.final_scores[7]).to eq([0])
      expect(bowling.final_scores[8]).to eq([0])
      expect(bowling.final_scores[9]).to eq([0])
      # expect(bowling.final_scores[10]).to eq([0])
    end
  end
end
require 'bowling'

RSpec.describe Bowling do
  describe '#frame' do
    it 'returns the correct frame' do
      bowling = Bowling.new
      expect(bowling.frame).to eq(1)
      bowling.add_score(2, 4)
      expect(bowling.frame).to eq(2)
      bowling.add_score(2, 5)
      expect(bowling.frame).to eq(3)
      bowling.add_score(7, 2)
      bowling.add_score(1, 5)
      expect(bowling.frame).to eq(5)
      bowling.add_score(7, 2)
      bowling.add_score(1, 5)
      bowling.add_score(7, 2)
      bowling.add_score(1, 5)
      bowling.add_score(7, 2)
      expect(bowling.frame).to eq(10)
      bowling.add_score(1, 5) # The game goes up to 10 frames so there shouldn't be an 11th
      bowling.score_card
      expect(bowling.frame).to eq(10)
    end
  end

  describe '#check_strike' do
    context 'User scores 10 on first roll' do
      it'returns true' do
        bowling = Bowling.new
        bowling.add_score(10)
        expect(bowling.check_strike(bowling.score_card[0])).to eq(true)
      end
    end

    context 'User scores 10 on second roll' do
      it 'returns false' do
        bowling = Bowling.new
        bowling.add_score(0, 10)
        expect(bowling.check_strike(bowling.score_card[0])).to eq(false)
      end
    end
  end

  describe '#add_score' do
    it 'pushes the score onto the array' do
      bowling = Bowling.new
      bowling.add_score(1, 2)
      bowling.add_score(3, 4)
      bowling.add_score(5, 5)
      bowling.add_score(7, 2)
      bowling.add_score(1, 6)
      expect(bowling.score_card).to eq([[1,2], [3,4], [5,5], [7,2], [1,6]])
      #expect(bowling.score).to eq 36
    end

    it 'pushes the score onto the last element of the array if the score
    card is 10 long and 10th frame is a spare' do
      bowling = Bowling.new
      bowling.add_score(0, 10)
      bowling.add_score(10, 0)
      bowling.add_score(3, 3)
      bowling.add_score(2, 8)
      bowling.add_score(3, 3)
      bowling.add_score(4, 3)
      bowling.add_score(3, 3)
      bowling.add_score(3, 7)
      bowling.add_score(3, 3)
      bowling.add_score(5, 5) # 10th frame is a spare
      bowling.add_score(6)
      expect(bowling.score_card.length).to eq 10
      expect(bowling.score_card.last).to eq [5, 5, 6]
    end

    it 'Rejects the last score if 10th frame is not a spare' do
      bowling = Bowling.new
      bowling.add_score(0, 10)
      bowling.add_score(10, 0)
      bowling.add_score(3, 3)
      bowling.add_score(2, 8)
      bowling.add_score(3, 3)
      bowling.add_score(4, 3)
      bowling.add_score(3, 3)
      bowling.add_score(3, 7)
      bowling.add_score(3, 3)
      bowling.add_score(5, 4) # 10th frame is a spare
      bowling.add_score(6)
      expect(bowling.score_card.last).to eq [5, 4]
      expect(bowling.score_card.length).to eq 10
    end
  end

  describe '#score' do
    it 'returns the basic score (without bonus points)' do
      bowling = Bowling.new
      bowling.add_score(0, 10)
      bowling.add_score(10, 0)
      expect(bowling.score).to eq(20)
      bowling.add_score(4, 5)
      expect(bowling.score).to eq (29)
    end

    it 'returns the basic score (without bonus points)' do
      bowling = Bowling.new
      bowling.score_card = bowling.score_card = [[5,5], [4,5], [8,2], [10,0],
        [6,2], [10, 0], [4, 6], [4, 4], [5,4], [6,2]]
      expect(bowling.score).to eq (92)
    end
  end

  describe '#bonus_score' do
    it 'returns the bonus score on strikes' do
      bowling = Bowling.new
      bowling.add_score(10, 0) # strike!
      bowling.add_score(8, 0) # Next two bowls add up to 8
      bowling.add_score(3, 0)
      expect(bowling.bonus_score).to eq(8)
    end

    it 'returns the bonus score on strikes' do
      bowling = Bowling.new
      bowling.add_score(10, 0) # strike!
      bowling.add_score(8, 1)
      bowling.add_score(7, 2)
      expect(bowling.bonus_score).to eq(9)
    end

    it 'returns the bonus score on spares' do
      bowling = Bowling.new
      bowling.add_score(5, 5) # spare
      bowling.add_score(3, 3)
      bowling.add_score(2, 2)
      expect(bowling.bonus_score).to eq(3)
      bowling.add_score(8, 2) # spare
      bowling.add_score(9, 0)
      expect(bowling.bonus_score).to eq(12)
    end

    it 'returns the bonus score on overlapping strikes and spares' do
      bowling = Bowling.new
      bowling.add_score(10, 0) # strike
      bowling.add_score(2, 8) # spare
      bowling.add_score(4, 3)
      bowling.add_score(3, 5)
      expect(bowling.bonus_score).to eq(14)
    end

    it 'returns multiple bonus scores on strikes/spares' do
      bowling = Bowling.new
      bowling.score_card =  bowling.score_card = [[5,5], [4,5], [8,2], [10,0], [6,2],
        [10, 0], [4, 6], [4, 4], [5,4], [6,2]]
      expect(bowling.bonus_score).to eq(36)
    end
  end

  describe '#total_score' do
    it 'returns the total score when extra roll is not factored in' do
      bowling = Bowling.new
      bowling.score_card = [[5,5], [4,5], [8,2], [10,0], [6,2], [10, 0], [4, 6], [4, 4], [5,4], [6,2]]
      expect(bowling.total_score).to eq(128)
    end

    xit 'returns the total score when got a spare on last frame' do
      bowling = Bowling.new
      bowling.score_card = []
    end
  end
end
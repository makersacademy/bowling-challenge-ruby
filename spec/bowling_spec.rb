require 'bowling'

RSpec.describe Bowling do
  describe '#frame' do
    it 'returns the correct frame' do
      bowling = Bowling.new
      bowling.add_score(2, 4)
      expect(bowling.frame).to eq(2)
      bowling.add_score(2, 5)
      expect(bowling.frame).to eq(3)
      bowling.add_score(7, 2)
      bowling.add_score(1, 5)
      expect(bowling.frame).to eq(5)
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
    end
  end
end
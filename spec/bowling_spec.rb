require 'bowling'
require 'stringio'

describe Bowling do
  subject(:bowling) { described_class.new }

  describe '#score_input' do
    it 'adds the input to the players score' do
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      expect(bowling.total_score).to eq 10
    end

    it 'collectively adds the scores together' do
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      expect(bowling.total_score).to eq 8
    end
  end

  describe '#score_message' do
    it 'tells the player their round and ball number' do
      expect(bowling.input_score_message).to eq 'Please enter your score for round 1, ball 1'
    end
  end

  describe '#scorer' do
    it 'changes the ball each throw' do
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      expect(bowling.input_score_message).to eq 'Please enter your score for round 1, ball 2'
    end

    it 'changes the round when there is strike' do
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      expect(bowling.input_score_message).to eq 'Please enter your score for round 2, ball 1'
    end

    it 'changes the round to 2 and ball back to 1 after two balls no split or strike' do
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      expect(bowling.input_score_message).to eq 'Please enter your score for round 2, ball 1'
    end

    it 'goes to the 9th round correctly with no strikes or spares' do
      16.times do
        allow($stdin).to receive(:gets).and_return(4)
        bowling.score_input
      end
      expect(bowling.input_score_message).to eq 'Please enter your score for round 9, ball 1'
    end

    it 'goes to the 9th round correctly with 4 strikes and no spares' do
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      expect(bowling.input_score_message).to eq 'Please enter your score for round 9, ball 1'
    end

    it 'goes to the 9th round correctly with 4 spares and 2 strikes' do
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(6)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(6)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(6)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(6)
      bowling.score_input
      expect(bowling.input_score_message).to eq 'Please enter your score for round 9, ball 1'
    end
  end

  describe '#strike' do
    it 'adds the correct strike bonus in the second round' do
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      expect(bowling.total_score).to eq 26
    end

    it 'continues to add the bonus with multiple strikes' do
      12.times do
        allow($stdin).to receive(:gets).and_return(10)
        bowling.score_input
        p bowling.bonus_score
      end
      expect(bowling.total_score).to eq 300
    end

    it 'calculates a lot of stuff' do
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(7)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      expect(bowling.total_score).to eq 100
    end

    it 'still calculates a lot of stuff' do
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      expect(bowling.total_score).to eq 87
    end

    it 'correctly calculates a stale game with 3 strike endings' do
      18.times do
        allow($stdin).to receive(:gets).and_return(4)
        bowling.score_input
      end
      3.times do
        allow($stdin).to receive(:gets).and_return(10)
        bowling.score_input
      end
      expect(bowling.total_score).to eq 102
    end
  end

  describe '#spares' do 
    it 'correctly sums a game with spares' do
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      expect(bowling.total_score).to eq 28
    end

    it 'correctly sums a game with spares' do
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(7)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(7)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      expect(bowling.total_score).to eq 74
    end

    it 'correctly sums a game with strikes and spares' do
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(5)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(7)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(7)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(9)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(0)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      expect(bowling.total_score).to eq 88
    end

    it 'correctly sums a game with strikes and spares' do
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(9)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      expect(bowling.total_score).to eq 154
    end

    it 'calculates the correct score in all 5 spares' do 
      21.times do
        allow($stdin).to receive(:gets).and_return(5)
        bowling.score_input
      end
      expect(bowling.total_score).to eq 150
    end

    it 'correctly sums a game with strikes and spares' do
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(9)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(4)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(6)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(3)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(1)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(9)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(2)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(8)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      allow($stdin).to receive(:gets).and_return(10)
      bowling.score_input
      expect(bowling.total_score).to eq 166
    end
  end

  


end

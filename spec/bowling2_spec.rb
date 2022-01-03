require 'bowling2'

describe Bowling2 do
  before(:each) do
    @bowling = Bowling2.new
  end

  describe '#input' do
    it 'raises error for invalid input' do
      expect { @bowling.input(11) }.to raise_error 'Invalid input'
    end
  end

  describe '#increase_turn' do
    it 'starts at 1' do
      expect(@bowling.turn).to eq 1
    end
    it 'goes to 2 after a input' do
      @bowling.input(5)
      expect(@bowling.turn).to eq 2
    end
    it 'goes back to 1 after 2nd input' do
      @bowling.input(5)
      @bowling.input(2)
      expect(@bowling.turn).to eq 1
    end
    it 'goes to 1 if there is a strike' do
      @bowling.input(10)
      expect(@bowling.turn).to eq 1
    end
  end

  describe '#increase_frame' do
    it 'starts at 1' do
      expect(@bowling.frame).to eq 1
    end
    it 'stays at 1 after 1 turn' do
      @bowling.input(5)
      expect(@bowling.frame).to eq 1
    end
    it 'goes to 2 after 2 turns' do
      @bowling.input(5)
      @bowling.input(2)
      expect(@bowling.frame).to eq 2
    end
    it 'goes to 2 after 1 turn if there has been a strike' do
      @bowling.input(10)
      expect(@bowling.frame).to eq 2
    end
    it 'raises a error when 10 frames have already been completed' do
      20.times do
        @bowling.input(3)
      end
      expect { @bowling.input(2) }.to raise_error 'Game Over. 10 Frames completed'
    end
  end

  describe 'total_score' do
    it 'starts at 0' do
      expect(@bowling.total_score).to eq 0
    end
    it 'has a score of 5 if you input 5' do
      @bowling.input(5)
      expect(@bowling.total_score).to eq 5
    end
    it 'has a score of 7 if you input 5 and then 2' do
      @bowling.input(5)
      @bowling.input(2)
      expect(@bowling.total_score).to eq 7
    end
    it 'has a score of 20 if you score a spare and then a 5 on the next turn' do
      @bowling.input(5)
      @bowling.input(5)
      @bowling.input(5)
      expect(@bowling.total_score).to eq 20
    end
    it 'gutter game scores 0' do
      20.times do
        @bowling.input(0)
      end
      expect(@bowling.total_score).to eq 0
    end
    it 'has a score of 24 if you score a strike and then a 7 on your next frame' do
      @bowling.input(10)
      @bowling.input(5)
      @bowling.input(2)
      expect(@bowling.total_score).to eq 24
    end
    it 'has a score of if you score 2 strikes and then a 0 on your next frame' do
      2.times do
        @bowling.input(10)
      end
      @bowling.input(0)
      expect(@bowling.total_score).to eq 30
    end
    it 'has a score of 240 if you score 9 strikes and then a 0 on your next frame' do
      9.times do
        @bowling.input(10)
      end
      @bowling.input(0)
      expect(@bowling.total_score).to eq 240
    end
    it 'has a score of 42 if you score a strike, followed by a 5, another 5, a 4 and a 4' do
      @bowling.input(10)
      @bowling.input(5)
      @bowling.input(5)
      @bowling.input(4)
      @bowling.input(4)
      expect(@bowling.total_score).to eq 42
    end
  end

  describe 'score' do
    it 'starts empty' do
      expect(@bowling.score).to be_empty
    end
    it 'stores a first input' do
      @bowling.input(5)
      expect(@bowling.score).to eq [5]
    end
    it 'stores multiple inputs' do
      @bowling.input(3)
      @bowling.input(2)
      @bowling.input(7)
      expect(@bowling.score).to eq [3, 2, 7]
    end
  end

  describe '#check_spare' do
    it 'returns true when there is a spare' do
      @bowling.input(3)
      @bowling.input(7)
      expect(@bowling.check_spare).to eq true
    end
    it 'returns false when no turns have been takes' do
      expect(@bowling.check_spare).to eq false
    end
    it 'returns false when turns have been taken but it is not a spare' do
      @bowling.input(2)
      @bowling.input(7)
      expect(@bowling.check_spare).to eq false
    end
    it 'returns false when a strike is thrown' do
      @bowling.input(10)
      expect(@bowling.check_spare).to eq false
    end
  end

  describe '#check_strike' do
    it 'returns true when first turn knocks down 10 pins' do
      @bowling.input(10)
      expect(@bowling.strike_frames).to include 1
    end
    it 'returns false when no turns have been taken' do
      expect(@bowling.check_strike(@bowling.frame)).to eq false
    end
    it 'returns false when first turn is less than 10' do
      @bowling.input(1)
      expect(@bowling.check_strike(@bowling.frame)).to eq false
    end
    it 'returns false when 10 pins are knocked down on turn 2' do
      @bowling.input(0)
      @bowling.input(10)
      expect(@bowling.check_strike(@bowling.frame)).to eq false
    end
  end

  describe '#valid_input' do
    it 'returns false for a value outside of 0 to 10' do
      expect(@bowling.valid_input(12)).to eq false
    end
    it 'returns false for a string' do
      expect(@bowling.valid_input('not a number')).to eq false
    end
    it 'returns true for a turn 1 value between 0 and 10' do
      expect(@bowling.valid_input(3)).to eq true
    end
    it 'returns false if sum of turn 1 and turn 2 greater than 10' do
      @bowling.input(4)
      expect(@bowling.valid_input(7)).to eq false
    end
    it 'returns true if sum of turn 1 and turn 2 within range of 0 to 10' do
      @bowling.input(1)
      expect(@bowling.valid_input(7)).to eq true
    end
  end
end

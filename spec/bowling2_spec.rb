require 'bowling2'

describe Bowling2 do

  before(:each) do
    @bowling = Bowling2.new
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
    it 'raises a error when 10 frames have already been completed' do
      20.times do
        @bowling.input(3)
      end
      expect(@bowling.input(5))
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
  end
  
end

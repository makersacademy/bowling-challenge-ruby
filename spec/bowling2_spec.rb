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
  end
  describe 'score' do
    it 'starts at 0' do
      expect(@bowling.score).to eq 0
    end
    it 'has a score of 5 if you input 5' do
      @bowling.input(5)
      expect(@bowling.score).to eq 5
    end
    it 'has a score of 7 if you input 5 and then 2' do
      @bowling.input(5)
      @bowling.input(2)
      expect(@bowling.score).to eq 7
    end
  end
  
end
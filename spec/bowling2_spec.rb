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
  
end
require './bowling.rb'
describe Bowling do 
  describe '.new_roll' do 
    it 'takes an argument' do 
      expect(Bowling).to respond_to(:new_roll).with(1).argument
    end 
  end 
end 
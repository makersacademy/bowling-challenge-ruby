require './lib/game.rb'

describe Game do
  let(:game) { Game.new}
  context '#pins_knocked_down' do 

    it 'allows player to enter the number of pins knocked down' do
      expect(subject.pins_knocked_down(5)).to eq 5
    end

    it 'recognises a strike' do
      # expect(subject.strike?).to eq 'strike'
      expect(subject.pins_knocked_down(10)).to eq 'strike'
    end
  end

  context '#consec_rolls' do
    it 'increase the count by one with each roll (from 0 to 1)' do
      # roll_count = 0
      expect(subject.rolls).to eq 1
    end

    it 'increase the count by one with each roll (from 1 to 2)' do
      subject.rolls
      expect(subject.rolls).to eq 2
    end
  end

  context '#frame_count' do
    it 'keeps count of the frame' do
      expect(subject.frame_count).to eq 1
    end
  end  
  
end
require './lib/game.rb'

describe Game do
  let(:game) { Game.new}
  context '#pins_knocked_down' do 

    it 'allows player to enter the number of pins knocked down' do
      expect(subject.pins_knocked_down(5)).to eq 5
    end
    
    it 'recognises a strike' do
      expect(subject.pins_knocked_down(10)).to eq 'strike'
    end

    it 'recognises a spare' do
      subject.pins_knocked_down(5)
      expect(subject.pins_knocked_down(5)).to eq 'spare'
    end
  end
    
  
  context '#frame_count' do
    it 'keeps count of the frame' do
      expect(subject.frame_count_up).to eq 1
    end
  end
    
    

  context '#consec_rolls' do
    it 'increase the count by one with each roll (from 0 to 1)' do
      subject.roll
      expect(subject.consec_rolls).to eq 1
    end
    

    it 'increase the count by one with each roll (from 1 to 2)' do
      subject.roll
      subject.roll
      expect(subject.consec_rolls).to eq 2
    end
  end
  

  context '#roll_count' do
    it 'increments when the player rolls' do
      subject.roll
      subject.roll
      expect(subject.roll_count).to eq 2
    end
    
    it 'resets to 0 when the player rolls reaches two rolls' do
      subject.roll
      subject.roll
      subject.roll
      expect(subject.roll_count).to eq 0
    end
  end


  context '#turn_score' do
    it 'records the player\'s score on their roll' do
      subject.pins_knocked_down(8)
      expect(subject.frame_score[0]).to be (8)
    end
  end
end

  

  

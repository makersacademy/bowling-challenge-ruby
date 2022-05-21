require 'scorecard'

describe Scorecard do
  
  describe 'initialize' do
    
    it 'scorecard starts in frame 1, roll 1, empty array of Spares, empty array of Strikes and o points' do
      
      expect(subject.frame).to eq 1
      expect(subject.roll).to eq 1
      expect(subject.spares).to be_empty
      expect(subject.strikes).to be_empty
      expect(subject.score).to eq 0

    end
  end

  describe '#next_frame' do
    
    it 'moves to next frame when called' do
      
      expect { subject.next_frame }.to change { subject.frame }.by(1)

    end

    it 'does not change the frame if in frame 10' do
      
      9.times { subject.next_frame }
  
      expect { subject.next_frame }.not_to change { subject.frame }

    end
  end

  describe '#next_roll' do
    
    it 'moves to next roll when call' do
      
      expect { subject.next_roll }.to change { subject.roll }.by(1)

    end

    it 'does not change the roll if in roll 2 for frames 1 to 9' do

      subject.next_roll
      
      expect { subject.next_roll }.not_to change { subject.roll }

    end

    it 'does change to roll 3 from roll 2 if in frame 10' do
      
      9.times { subject.next_frame }
      subject.next_roll

      expect { subject.next_roll }.to change { subject.roll }.by(1)
      
    end
  end
end

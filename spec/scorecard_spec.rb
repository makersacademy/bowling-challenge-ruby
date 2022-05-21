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

  describe '#add_spare' do
    
    it 'adds a Spare instance in @spares' do
      
      subject.add_spare

      expect(subject.spares.first).to be_a(Spare)

    end
  end

  describe '#add_strike' do
    
    it 'adds a Strike instance in @strikes' do
      
      subject.add_strike

      expect(subject.strikes.first).to be_a(Strike)
      
    end
  end

  describe '#add_spare_score' do

    it 'adds the total score from a spare into the scorecard score and takes it out of array' do
    
      spare_dbl = double("Spare double")
      allow(spare_dbl).to receive_messages(:score => 15)
      subject.add_spare(spare_dbl)

      expect(subject.spares).not_to be_empty
      expect { subject.add_spare_score }.to change { subject.score }.by(15)
      expect(subject.spares).to be_empty

    end
  end

  describe '#add_strike_score' do

    it 'adds the total score from a strike into the scorecard score and takes it out of array' do
    
      strike_dbl = double("Strike double")
      allow(strike_dbl).to receive_messages(:score => 15)
      subject.add_strike(strike_dbl)

      expect(subject.strikes).not_to be_empty
      expect { subject.add_strike_score }.to change { subject.score }.by(15)
      expect(subject.strikes).to be_empty

    end
  end
end

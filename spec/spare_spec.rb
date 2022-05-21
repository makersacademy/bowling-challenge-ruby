require 'spare'

describe Spare do
  
  describe '#score' do
    
    it 'returns a score of 10 from the Spare when new' do
      
      expect(subject.score).to eq 10

    end

    it 'returns a score of 15 from the Spare when it has been added 5 as a bonus' do

      subject.add(5)

      expect(subject.score).to eq 15

    end
  end

  describe '#add' do
    
    it 'adds 5 to @score when called with 5 as argument' do

      expect { subject.add(5) }.to change { subject.score }.by(5)

    end

    it 'raise an error if tries to add more than 10' do

      expect { subject.add(11) }.to raise_error 'Spare can only add 10 more points'

    end

    it 'raises an error if tries to add points twice (spare bonus only counts next roll)' do
      
      subject.add(3)

      expect { subject.add(2) }.to raise_error 'Spare only counts next roll for bonus points'

    end
  end

  describe '#complete?' do
    
    it 'it is complete when #add has been called once (even if has been added 0 points)' do
      
      subject.add(0)

      expect(subject).to be_complete

    end

    it 'it is not complete when #add has not been called' do
      
      expect(subject).not_to be_complete

    end
  end
end

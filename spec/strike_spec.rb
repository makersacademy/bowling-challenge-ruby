require 'strike'

describe Strike do
  
  describe '#score' do
    
    it 'returns a score of 10 from the Strike when new' do
      
      expect(subject.score).to eq 10

    end

    it 'returns a score of 15 from the Strike when it has been added 5 as a bonus' do

      subject.add(5)

      expect(subject.score).to eq 15

    end
  end

  describe '#add' do
    
    it 'adds 5 to @score when called with 5 as argument' do

      expect { subject.add(5) }.to change { subject.score }.by(5)

    end

    it 'adds 15 to @score when called twice with that amount of points' do
      
      subject.add(7)
      subject.add(8)

      expect(subject.score).to eq 25

    end

    it 'raise an error if tries to add more than 10 at once' do

      expect { subject.add(11) }.to raise_error 'Strike can only add 10 more points per roll'

    end

    it 'raises an error if tries to add points three times (strike bonus only counts 2 next rolls)' do
      
      subject.add(3)
      subject.add (4)

      expect { subject.add(2) }.to raise_error 'Strike only counts 2 next rolls for bonus points'

    end
  end

  describe '#complete?' do
    
    it 'it is complete when #add has been called twice (even if it has been added 0 points)' do
      
      subject.add(0)
      subject.add(5)

      expect(subject).to be_complete

    end

    it 'it is not complete when #add has not been called twice' do
      
      subject.add(7)
      
      expect(subject).not_to be_complete

    end
  end
end

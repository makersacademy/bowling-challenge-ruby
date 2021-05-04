require 'scorecard'

describe Scorecard do
  describe '#add_score' do
    it 'updates the total score' do
      subject.add_score(5)


      expect(subject.scorecard[1][:total_score]).to eq 5
    end

    it 'determines which roll is the current roll' do
      subject.add_score(1)
    
      subject.add_score(2)

      expect(subject.scorecard[1][:roll_1_score]).to eq 1
      expect(subject.scorecard[1][:roll_2_score]).to eq 2
    end

    it 'updates the total score of last frame if we strike' do
      subject.add_score(10)
      subject.add_score(5)
      subject.add_score(4)
      p subject.scorecard
      
      expect(subject.scorecard[1][:total_score]).to eq 19
    end
  end
end

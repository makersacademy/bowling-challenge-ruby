require 'scorecard'

describe Scorecard do
  describe '#add_score' do
    it 'updates the total score' do
      subject.add_score(5)


      expect(subject.scorecard.first[:total_score]).to eq 5
    end

    it 'determines which roll is the current roll' do
      subject.add_score(1)
    
      subject.add_score(2)

      # p subject.current_frame
      subject.roll


      expect(subject.scorecard.first[:roll_1_score]).to eq 1
      expect(subject.scorecard.first[:roll_2_score]).to eq 2
    end
  end
end

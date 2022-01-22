require 'scorecard'

describe Scorecard do 
  describe '#frame_scores' do 
  #   it 'returns 10 element array when all rolls are 0' do 
  #     10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
  #     expect(subject.frame_scores).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #     #expect(subject.outcome).to eq 'gutter game'
  #   end
    it 'returns gutter game when all rolls are 0' do 
      10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
      expect(subject.frame_scores).to eq 0
      #expect(subject.outcome).to eq 'gutter game'
    end
  end
    
  describe '#outcome' do 
    it 'returns gutter game when all rolls are 0' do 
      10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
      expect(subject.outcome).to eq 'gutter game'
      #expect(subject.outcome).to eq 'gutter game'
    end
    
  end 
end


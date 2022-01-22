require 'scorecard'

describe Scorecard do 
  describe '#frame_scores' do 
  #   it 'returns 10 element array when all rolls are 0' do 
  #     10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
  #     expect(subject.frame_scores).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #     #expect(subject.outcome).to eq 'gutter game'
  #   end
    it 'returns 0 when all rolls are 0' do 
      10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
      expect(subject.frame_scores).to eq 0
      #expect(subject.outcome).to eq 'gutter game'
    end

    it 'returns 300 when all rolls are 10, meaning 2 extra rolls of 10' do 
      12.times {subject.roll_score(10,0)} # player inputs the roll score using roll_score method
      expect(subject.frame_scores).to eq 300
      #expect(subject.outcome).to eq 'gutter game'
    end

  end
    
  describe '#outcome' do 
    it 'returns gutter game when all rolls are 0' do 
      10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
      expect(subject.outcome).to eq 'gutter game'
    end

    # it 'returns perfect game when all rolls are 0' do 
    #   12.times {subject.roll_score(10,10)} # player inputs the roll score using roll_score method
    #   expect(subject.outcome).to eq 'perfect game'
    #  end
    
  end 
end


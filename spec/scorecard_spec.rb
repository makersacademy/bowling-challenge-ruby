require 'scorecard'

describe Scorecard do 
  subject(:no_bonus_game) { described_class.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]) }
  subject(:strikes_game) { described_class.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [10, 0], [2, 0], [10, 0], [4, 0], [0, 0]]) }
  subject(:spares_game) { described_class.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [8, 2], [2, 0], [10, 0], [0, 0], [0, 0]]) }
  subject(:perfect_game) { described_class.new([[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]]) }
  subject(:all_zero) { described_class.new([[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]) }
  it 'begins with an array of 10 frames i.e. each element has 2 rolls' do 

  end

  it 'can calculate bonus score without consecutive strikes' do 
   
  end
  
  describe '#is_strike?' do 
    it 'identifies if frame is a strike' do 
      strike_frame = strikes_game.frames[5]
      expect(strikes_game.strike?(frame: strike_frame)).to be true
    end
  end

  it 'knows if the game score is a perfect game' do 
    expect(perfect_game.perfect_game?).to eq true
  end

  it 'knows if the game score is a gutter game' do 
    expect(all_zero.gutter_game?).to eq true
  end

  describe '#is_spare? identifies if frame is a spare' do 
    it 'identifies if frame is a spare' do 
      spare_frame = spares_game.frames[5]
      expect(spares_game.spare?(frame: spare_frame)).to be true
    end
  end
  
  #describe '#frames' do 
  #   it 'returns 10 element array when all rolls are 0' do 
  #     10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
  #     expect(subject.frame_scores).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  #     #expect(subject.outcome).to eq 'gutter game'
  #   end
  #   
  #it 'returns 0 when all rolls are 0' do 
  #     10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
  #     expect(subject.frame_scores).to eq 0
  #     #expect(subject.outcome).to eq 'gutter game'
  #   end

  #   it 'returns 300 when all rolls are 10, meaning 2 extra rolls of 10' do 
  #     12.times {subject.roll_score(10,0)} # player inputs the roll score using roll_score method
  #     expect(subject.frame_scores).to eq 300
  #     #expect(subject.outcome).to eq 'gutter game'
  #   end
    
  # describe '#outcome' do 
  #   it 'returns gutter game when all rolls are 0' do 
  #     10.times {subject.roll_score(0,0)} # player inputs the roll score using roll_score method
  #     expect(subject.outcome).to eq 'gutter game'
  #   end
  # end

    # it 'returns perfect game when all rolls are 0' do 
    #   12.times {subject.roll_score(10,10)} # player inputs the roll score using roll_score method
    #   expect(subject.outcome).to eq 'perfect game'
    #  end    
end


require 'scorecard'

describe Scorecard do 
  subject(:no_bonus_game) { described_class.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]) }
  subject(:bonus_game) { described_class.new([[10, 0], [10, 0], [3, 1], [9, 1], [4, 4], [10, 0], [2, 0], [10, 0], [0, 0], [0, 0, 0]]) }
  subject(:spares_game) { described_class.new([[4, 5], [3, 2], [3, 1], [2, 1], [4, 4], [8, 2], [2, 0], [10, 0], [0, 0], [0, 0, 0]]) }
  subject(:perfect_game) { described_class.new([[10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 0], [10, 10, 10]]) }
  subject(:all_zero) { described_class.new([[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]]) }
  
  it 'has 10 frames' do 
    expect(subject.frames.length).to eq 10
  end

  it 'has an array of frames' do 
    expect(subject.frames).to be_a_kind_of(Array)
  end
  
  it 'can calculate and display the scores for each frame, including bonuses' do 
    expect(no_bonus_game.frame_scores).to eq [9, 5, 4, 3, 8, 0, 0, 0, 0, 0]
  end 
  it 'can calculate and display the scores for each frame, including bonuses' do 
    expect(bonus_game.frame_scores).to eq [23, 14, 4, 14, 8, 12, 2, 10, 0, 0]
  end 

  describe '#bonus' do
    context 'when strike' do 
      it 'if followed by another strike, bonus is 10 plus the 1st roll of the frame that comes after the subsequent strike' do 
        expect(bonus_game.bonus(0)).to eq 13
      end

      it 'is sum of next frame if followed by a non-strike frame' do 
        expect(bonus_game.bonus(1)).to eq 4
        expect(bonus_game.bonus(5)).to eq 2
      end
    end

    context 'when spare' do 
      it 'is 1st roll of the next frame' do 
        expect(bonus_game.bonus(3)).to eq 4
      end
    end

    context 'when neither spare nor strike ' do 
      it 'is zero' do 
        expect(bonus_game.bonus(2)).to eq 0
      end
    end
  end 
  
  describe '#is_strike?' do 
    it 'identifies if frame is a strike' do 
      strike_frame = bonus_game.frames[5]
      expect(bonus_game.strike?(frame: strike_frame)).to be true
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
  
  
end


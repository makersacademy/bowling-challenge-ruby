require 'scoring'

describe Scoring do

  context 'not the final frame' do

    it 'adds two non-bonus integers together' do
      frames = [{ roll_1: 8, roll_2: 1 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 9
    end
    
    it 'adds next two (non-strike) rolls to a strike' do
      frames = [{ roll_1: :X }, { roll_1: 3, roll_2: 6 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 19
      
    end

    it 'adds consecutive strike rolls' do
      frames = [{ roll_1: :X }, { roll_1: :X }, { roll_1: 3, roll_2: 4 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 23
      expect(scoring.calculation[1]).to contain_exactly 17
      expect(scoring.calculation.last).to contain_exactly 7
    end

    it 'adds next roll to a spare' do
      frames = [{ roll_1: 3, roll_2: :/ }, { roll_1: 3, roll_2: 4 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 13
      expect(scoring.calculation.last).to contain_exactly 7
    end

    it 'adds strike to a spare' do
      frames = [{ roll_1: 3, roll_2: :/ }, { roll_1: :X }, { roll_1: 3, roll_2: 4 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 20
      expect(scoring.calculation[1]).to contain_exactly 17
      expect(scoring.calculation.last).to contain_exactly 7
    end

    it 'adds spare to a strike' do
      frames = [{ roll_1: :X }, { roll_1: 3, roll_2: :/ }, { roll_1: 3, roll_2: 4 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 20
      expect(scoring.calculation[1]).to contain_exactly 13
      expect(scoring.calculation.last).to contain_exactly 7
    end

    it 'check if logic works for turkey' do
      frames = [{ roll_1: :X }, { roll_1: :X }, { roll_1: :X }, { roll_1: 3, roll_2: 4 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 30
      expect(scoring.calculation[1]).to contain_exactly 23
      expect(scoring.calculation[2]).to contain_exactly 17
      expect(scoring.calculation.last).to contain_exactly 7
    end

    it 'check if logic works for 5 strikes' do
      frames = [
        { roll_1: :X }, { roll_1: :X }, { roll_1: :X }, 
        { roll_1: :X }, { roll_1: :X }, { roll_1: 1, roll_2: 2 }
      ]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 30
      expect(scoring.calculation[2]).to contain_exactly 30
      expect(scoring.calculation.last).to contain_exactly 3
    end

    it 'returns base value of strike if no subsequent rolls' do
      frames = [{ roll_1: :X }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 10
    end

    it 'returns base value of spare if no subsequent rolls' do
      frames = [{ roll_1: 2, roll_2: :/ }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 10
    end
    
    it 'begins to calculate strike bonus after one further roll' do
      frames = [{ roll_1: :X }, { roll_1: 2 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 12
      expect(scoring.calculation.last).to contain_exactly 2
    end

  end

  context 'final frame' do

    it 'calculates 3 strikes' do
      frames = [{ roll_1: :X, roll_2: :X, roll_3: :X }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 30
    end

    it 'calculates strike followed by two low rolls ' do
      frames = [{ roll_1: :X, roll_2: 2, roll_3: 3 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 15
    end

    it 'calculates low roll, strike, strike' do
      frames = [{ roll_1: 3, roll_2: :X, roll_3: :X }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 23
    end

    it 'calculates strike, low roll, strike' do
      frames = [{ roll_1: :X, roll_2: 3, roll_3: :X }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 23
    end

    it 'calculates strike, strike, low roll' do
      frames = [{ roll_1: :X, roll_2: :X, roll_3: 3 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 23
    end

    it 'calculates spare followed by low roll' do
      frames = [{ roll_1: 3, roll_2: :/, roll_3: 3 }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 13  
    end

    it 'calculates spare followed by strike' do
      frames = [{ roll_1: 3, roll_2: :/, roll_3: :X }]
      scoring = Scoring.new(frames)
      expect(scoring.calculation.first).to contain_exactly 20
    end
  end

end

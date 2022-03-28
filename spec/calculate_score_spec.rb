require_relative '../calculate_score'

describe CalculateScore do

  it 'calculates a gutter game' do
    expect(subject.calculate([0,0,0,0,0,0,0,0,0,0])).to eq 0
  end

  it 'should calculate an assortment of scores' do
    expect(subject.calculate([9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9])).to eq 190
  end

  it 'should calculate an assortment of scores' do
    expect(subject.calculate([9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9])).to eq 190
  end
    
  it 'should a perfect game' do
    expect(subject.calculate([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])).to eq 300
  end

end

# Test.assertEquals(bowlingScore([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]), 0);
# Test.assertEquals(bowlingScore([9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9,1, 9]), 190);
# Test.assertEquals(bowlingScore([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]), 300);
# Test.assertEquals(bowlingScore([0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 10,1,0]), 11);
# Test.assertEquals(bowlingScore([0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 10, 1,0]), 12);
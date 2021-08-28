require 'validity'

describe Validity do

  describe '#valid?' do
  
  it 'returns false if number outside min/max range' do
    expect(subject.valid?(20, 1, 10)).to be false
    expect(subject.valid?(-10, 1, 10)).to be false
  end

  it 'returns true if number inside min/max range' do
    expect(subject.valid?(10, 1, 10)).to be true
    expect(subject.valid?(1, 1, 10)).to be true
  end

  it 'returns false if not an integer' do
    expect(subject.valid?("a", 1, 10)).to be false
    expect(subject.valid?([], 1, 10)).to be false
  end

  end

end

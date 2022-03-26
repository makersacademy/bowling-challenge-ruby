require 'frame'

describe Frame do

  subject(:frame) { described_class.new }

  describe '#first_roll'
  it 'returns 2 if knocks down 2 pins on first roll' do
    expect(frame.first_roll(2)).to eq 2
  end

  describe '#second_roll'
  it 'returns 7 if knocks down 7 pins on second roll' do
    expect(frame.second_roll(7)).to eq 7
  end

end

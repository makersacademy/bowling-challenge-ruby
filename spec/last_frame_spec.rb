require 'last_frame'

RSpec.describe LastFrame do

  let(:last_frame) { LastFrame.new}

  it 'inherits Frame' do
    expect(last_frame).to be_a Frame
  end

  it 'inherits #strike?' do
    last_frame.first_roll = 10
    expect(last_frame.strike?).to eq true
  end

  describe '#second_strike?' do
    it 'returns true on second roll strike' do
      last_frame.second_roll = 10
      expect(last_frame.second_strike?).to eq true
    end

    it 'returns false on second roll that is not strike' do
      last_frame.second_roll = 4
      expect(last_frame.second_strike?).to eq false
    end

    it 'stores third roll' do
      last_frame.third_roll = 4
      expect(last_frame.third_roll).to eq 4
    end
  end
end
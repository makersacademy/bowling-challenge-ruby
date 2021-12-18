require 'frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '#initialize' do
    it 'sets up instance variables to hold scores per roll' do
      expect(frame.first_roll).to eq 0
      expect(frame.second_roll).to eq 0
      expect(frame.strike).to eq false
      expect(frame.spare).to eq false     
    end
  end
end
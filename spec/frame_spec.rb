require 'frame'

describe Frame do

  describe '#initialize' do
    it 'starts a new frame with a score of 0' do
      expect(subject.total).to eq(0)
    end
  end



end
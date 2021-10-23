require 'frame'

describe Frame do
  describe '#score' do
    it 'should have score' do
      expect(Frame.new).to respond_to(:score)
    end
  end
end
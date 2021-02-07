require 'game'

describe Game do

  describe 'add' do
    it 'adds number of pins knocked down' do
      expect { subject.add(3) }.to change { subject.throws.size }.by(1)
    end
  end

end
require 'scoreboard'

describe Scoreboard do
  before do
    @rolls = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]
    @scoreboard = Scoreboard.new(@rolls)
  end

  context '#strike' do
    it 'return true when strike' do
      expect(@scoreboard.strike?(10)).to be true
    end
    it 'return false when not strike' do
      expect(@scoreboard.strike?(3)).to be_falsey
    end
  end

  context '#spare' do
    it 'return true when spare' do
      expect(@scoreboard.spare?(8, 2)).to be true
    end
    it 'return false when not spare' do
      expect(@scoreboard.spare?(3, 6)).to be_falsey
    end
  end

end

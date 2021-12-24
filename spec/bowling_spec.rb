require 'bowling'

describe Bowling do
  describe '#enter_score' do
    context 'Player enters a score outside of 0 to 10'
    it 'returns an error' do
      bowling = Bowling.new
      expect{bowling.enter_score(11)}.to raise_error 'Outside of Range'
    end
  end
end
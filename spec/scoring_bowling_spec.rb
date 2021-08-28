require 'scoring_bowling'

describe Scoring_Bowling do

  describe 'initialize' do
    it 'is expected to have 2 public attributes' do
      expect(Scoring_Bowling.new).to have_attributes(:rolls => [], :frame => 0)
    end
  end

end

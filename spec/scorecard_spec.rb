require 'scorecard'

describe Scorecard do
  
  describe 'initialisation' do
    it 'will intitalise an instance of Scorecard' do
      scorecard = Scorecard.new
      expect(scorecard).to be_a Scorecard
    end
  end

end

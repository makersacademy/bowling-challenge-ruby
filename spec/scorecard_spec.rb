require 'scorecard'

describe Scorecard do
  it 'can create a new instance of Scorecard' do 
    scorecard = Scorecard.new
    expect(scorecard).to eq scorecard
  end

end
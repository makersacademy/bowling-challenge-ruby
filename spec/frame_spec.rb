require 'frame'

describe Frame do
  let(:boring)      { double(Frame, number: 1, first_roll: 1, second_roll: 1) }
  let(:spare)       { double(Frame, number: 3, first_roll: 5, second_roll: 5) }
  let(:strike)      { double(Frame, number: 2, first_roll: 10) }
  let(:blank_sheet) { double('Scoresheet', scores: [boring, spare, strike]) }

  it 'has a first roll' do   
    
  end
end

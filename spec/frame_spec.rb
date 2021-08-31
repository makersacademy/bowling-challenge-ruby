require 'frame'

describe Frame do
  let(:boring)      { double(Frame, number: 1, first_roll: 1, second_roll: 1) }
  let(:spare)       { double(Frame, number: 3, first_roll: 5, second_roll: 5) }
  let(:strike)      { double(Frame, number: 2, first_roll: 10) }
  let(:mixed_sheet) { double('Scorecard', scores: [boring, spare, strike]) }

  it 'has a first roll' do   
    frame = Frame.new(mixed_sheet, 1, 1)

    expect(frame.first_roll).to eq 1
  end
end

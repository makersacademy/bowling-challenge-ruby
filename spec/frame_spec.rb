require 'frame'

describe Frame do
  let(:boring)      { double(Frame, number: 1, first_roll: 1, second_roll: 1) }
  let(:spare)       { double(Frame, number: 3, first_roll: 5, second_roll: 5) }
  let(:strike)      { double(Frame, number: 2, first_roll: 10) }
  let(:mixed_sheet) { double('Scorecard', scores: [boring, spare, strike]) }

  it 'has a number' do
    frame = Frame.new(mixed_sheet, 6, 1)

    expect(frame.number).to eq 6
  end

  it 'has a first roll' do   
    frame = Frame.new(mixed_sheet, 1, 1)

    expect(frame.first_roll).to eq 1
  end

  it 'allows a second roll to be added' do   
    frame = Frame.new(mixed_sheet, 1, 1)
    frame.second_roll = 5

    expect(frame.second_roll).to eq 5
  end

  it 'recognises strikes' do
    frame = Frame.new(mixed_sheet, 1, 10)

    expect(frame.strike?).to eq true
    expect(frame.spare?).to eq false
    expect(frame.boring?).to eq false
  end

  it 'recognises spares' do
    frame = Frame.new(mixed_sheet, 1, 4)
    frame.second_roll = 6

    expect(frame.spare?).to eq true
    expect(frame.strike?).to eq false
    expect(frame.boring?).to eq false
  end

  it 'recognises boring frames' do
    frame = Frame.new(mixed_sheet, 1, 3)
    frame.second_roll = 4

    expect(frame.boring?).to eq true
    expect(frame.strike?).to eq false
    expect(frame.spare?).to eq false
  end
end

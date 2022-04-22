require 'frame'

describe Frame do

  let(:frame) { described_class.new }

  it 'Should know how many rolls have been rolled' do
    expect(frame.rolls).to eq(0)
  end

  it 'Should know how many pins are remaining for this frame' do
    expect(frame.pins_remaining).to eq(10)
  end

  it 'Should know how many pins were taken down in first roll' do
    expect(frame.first_roll).to eq(0)
  end

  it 'Should know how many pins were taken down in second roll' do
    expect(frame.second_roll).to eq(0)
  end

  it 'Should know how many pins were taken down in third roll' do 
    expect(frame.second_roll).to eq(0)
  end

end

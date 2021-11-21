require 'frame'

describe Frame do
  before do
    @test_frame = Frame.new(3,7,2)
    @spare_frame = Frame.new(2,8,2)
    @strike_frame = Frame.new(1,10)
  end

  it 'checks that a new frame can be created' do
    expect(@test_frame.first_bowl).to eq 7
  end

  it 'checks that a third bowl is nil if not specified' do
    expect(@test_frame.third_bowl).to eq nil
  end

  it 'checks that a Frame where both bowls add up to 10 can be marked as a spare' do
    expect(@spare_frame.spare?).to eq true
  end

  it 'checks that a Frame where both bowls do not up to 10, is not marked as a spare' do
    expect(@test_frame.spare?).to eq false
  end

  it 'checks that a Frame can be correctly marked as a strike' do
    expect(@strike_frame.strike?).to eq true
  end

  it 'checks that a Frame where both bowls add up to 10 is not given as a strike' do
    expect(@spare_frame.strike?).to eq false
  end

end
  
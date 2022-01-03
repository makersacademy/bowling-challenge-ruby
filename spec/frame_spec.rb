require 'frame'

describe Frame do

  it 'should be able to input one roll' do
    subject.roll(1)
    expect(subject.rolls).to match_array [1]
  end

end
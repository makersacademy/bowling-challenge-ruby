require 'score'

describe Score do
  it 'takes an integer for the number of pins knocked down that turn' do
    expect(subject.bowl(pins: 5)).to eq(5)
  end
end

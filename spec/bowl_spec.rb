require 'bowl'

describe Bowl do
  subject { described_class.new(pins: 6) }
  
  it 'records the number of pins knocked down in a single bowl' do
    expect(subject.pins).to eq 6
  end
end
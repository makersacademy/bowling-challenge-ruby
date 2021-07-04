require 'roll'

describe Roll do
  subject { described_class.new(5) }

  it 'can knock down pins' do
    expect(subject.pins).to eq 5
  end
end

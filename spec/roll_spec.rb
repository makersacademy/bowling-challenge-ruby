require 'roll'

describe Roll do
  it { is_expected.to have_attributes(pins: 0) }

  it 'can knock down pins' do
    subject.pins = 5
    expect(subject.pins).to eq 5
  end
end

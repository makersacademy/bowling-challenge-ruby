require 'bowling'

describe 'gutter' do
  it 'shows zero points overall' do
    result = Scorecard.new

    expect(result.gutter).to eq 0
  end
end

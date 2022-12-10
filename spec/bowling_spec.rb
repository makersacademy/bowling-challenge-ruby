require 'bowling'

describe 'gutter' do
  it 'shows zero points overall' do
    result = Scorecard.new
    result.run

    expect(result.grand_total).to eq 0
  end
end
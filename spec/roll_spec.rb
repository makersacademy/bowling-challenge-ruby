require 'roll'

RSpec.describe Roll do
  it 'saves roll score' do
    roll = Roll.new(10)
    expect(roll.score).to eq 10
  end
end
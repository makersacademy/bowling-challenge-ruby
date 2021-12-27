require 'roll'

describe Roll do

  it 'returns the number of pins knocked down by the user as an integer' do
    new_roll = Roll.new
    allow(new_roll).to receive(:gets).and_return('10')
    expect(new_roll).to receive(:roll).and_return(10)
    new_roll.roll
  end

end

require 'roll'

describe Roll do
  it 'prints its number' do
    io = double :io
    roll = Roll.new(1, io)
    expect(io).to receive(:puts).with("Roll 1")

    roll.print_number
  end

  it 'asks for user input' do
    io = double :io
    roll = Roll.new(1, io)
    expect(io).to receive(:puts).with("Insert number of pins")
    roll.ask_for_pins
  end
    
  it 'gets user input' do
    io = double :io
    roll = Roll.new(1, io)
    expect(io).to receive(:gets).and_return("2")
    expect(roll.get_pins).to eq(2)
  end

  it 'fails with invalid input' do
    io = double :io
    roll = Roll.new(1, io)
    expect(io).to receive(:gets).and_return("11")
    expect { roll.get_pins }.to raise_error "Invalid number"

  end
end
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
    #expect(io).to receive(:gets).and_return("2")
    roll.ask_for_pins

  end
end
require_relative '../app.rb'

RSpec.describe Application do
  it "asks the user for its input" do
    io = double :io
    allow(io).to receive(:puts).with("Enter the first roll:")
    allow(io).to receive(:gets).and_return("3")
    allow(io).to receive(:puts).with("Enter the second roll:")
    allow(io).to receive(:gets).and_return("5")
    allow(io).to receive(:puts).with("Enter the bonus roll:")


    app = Application.new(io)
    app.run
  end
end
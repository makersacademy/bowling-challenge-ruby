require 'app'

describe Application do
  it "asks user for a roll and moves to next frame if they enter 10" do
    app = Application.new(@io)
    expect(@io).to receive(:puts).with("Frame 1:").ordered
    expect(@io).to receive(:gets).and_return(10).ordered
    expect(@io).to receive(:puts).with("Frame 2:").ordered


  end
end
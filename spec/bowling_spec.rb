require "bowling"

RSpec.describe Application do
  context "when a user gets a perfect game" do
    it "returns a score of 300 and a perfect game message" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 2")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 3")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 5")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")
        
        expect(io).to receive(:puts).with("Frame 6")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 7")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 8")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 9")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 10")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")


        expect(io).to receive(:puts).with("You get two extra rolls as you got a strike in the 10th frame!")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first bonus roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second bonus roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")
        
        expect(io).to receive(:puts).with("You scored 300!")
        expect(io).to receive(:puts).with("That's a perfect game! Congratulations!!")

        app.run
    end
  end

  context "when a user plays an average game" do
    it "returns the correct score" do
        io = double :io
        app = Application.new(io)

        expect(io).to receive(:puts).with("Frame 1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("3")

        expect(io).to receive(:puts).with("Frame 2")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("3")

        expect(io).to receive(:puts).with("Frame 3")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("6")

        expect(io).to receive(:puts).with("Frame 5")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("2")
        
        expect(io).to receive(:puts).with("Frame 6")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("9")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Spare!")

        expect(io).to receive(:puts).with("Frame 7")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("2")

        expect(io).to receive(:puts).with("Frame 8")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("10")
        expect(io).to receive(:puts).with("Strike!")

        expect(io).to receive(:puts).with("Frame 9")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("3")

        expect(io).to receive(:puts).with("Frame 10")
        expect(io).to receive(:puts).with("How many pins were knocked down by the first roll?")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("How many pins were knocked down by the second roll?")
        expect(io).to receive(:gets).and_return("0")
        
        expect(io).to receive(:puts).with("You scored 88!")

        app.run
    end
  end
end
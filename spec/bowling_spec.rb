require './bowling'

RSpec.describe Bowling do
    it "greets the user" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome, what is your name?")
      expect(io).to receive(:gets).and_return("Oana")
      expect(io).to receive(:puts).with("Hello, Oana! Let's start bowling!")
      bowling = Bowling.new(io)
      bowling.welcome
    end

    it 'handles frame' do
        io = double :io
        expect(io).to receive(:puts).with("Enter frame 1, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 1, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 2, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 2, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 3, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 3, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 4, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 4, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 5, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 5, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 6, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 6, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 7, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 7, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 8, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 8, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 9, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 9, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).with("Enter frame 10, roll 1:")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("Enter frame 10, roll 2:")
        expect(io).to receive(:gets).and_return("4")
        expect(io).to receive(:puts).and_return("Well done Oana! You scored 50 points in this bowling game!")
        bowling = Bowling.new(io)
        bowling.frame
      end
  end
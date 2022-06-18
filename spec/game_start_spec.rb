require 'user_interface'

RSpec.describe UserInterface do
  describe 'app starts' do
    xit 'greets users and asks users to input the first input when app starts' do
      io = double(:io)
      game = double(:game)
      expect(game).to receive(:frame).and_return(1)
      expect(game).to receive(:roll).and_return(1)
      interface = UserInterface.new(io, game)

      expect(io).to receive(:puts).with("Welcome to the 🎳 Bowling Game")
      expect(io).to receive(:puts).with("I am here to keep your score!")
      expect(io).to receive(:puts).with("Frame No. 1, Roll No. 1")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("1")
      expect(game).to receive(:roll_pin).and_return(1)
      expect(game).to receive(:pins_rolled).and_return([[1], [], [], [], [], [], [], [], [], []])
      expect(io).to receive(:puts).with([[1], [], [], [], [], [], [], [], [], []])
      interface.run
    end

    xit 'keeps asking user if the input is wrong' do
      io = double(:io)
      game = double(:game)
      expect(game).to receive(:frame).and_return(1)
      expect(game).to receive(:roll).and_return(1)
      interface = UserInterface.new(io, game)
      expect(io).to receive(:puts).with("Welcome to the 🎳 Bowling Game")
      expect(io).to receive(:puts).with("I am here to keep your score!")
      expect(io).to receive(:puts).with("Frame No. 1, Roll No. 1")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("11")
      expect(io).to receive(:puts).with("Invalid input. You can only input an integer between 0 and 10.")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("AB")
      expect(io).to receive(:puts).with("Invalid input. You can only input an integer between 0 and 10.")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("10")
      expect(game).to receive(:roll_pin).and_return(10)
      expect(game).to receive(:pins_rolled).and_return([[10],[],[],[],[],[],[],[],[],[]])
      expect(io).to receive(:puts).with([[10],[],[],[],[],[],[],[],[],[]])

      interface.run
    end
  end

  describe 'game continues to second input' do
    it 'game asks users to input the second input' do
      io = double(:io)
      game = double(:game)
      expect(game).to receive(:frame).and_return(1)
      expect(game).to receive(:roll).and_return(1)
      interface = UserInterface.new(io, game)
      expect(io).to receive(:puts).with("Welcome to the 🎳 Bowling Game")
      expect(io).to receive(:puts).with("I am here to keep your score!")
      expect(io).to receive(:puts).with("Frame No. 1, Roll No. 1")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("1")
      expect(game).to receive(:roll_pin).and_return(1)
      expect(game).to receive(:frame).and_return(1)
      expect(game).to receive(:roll).and_return(2)
      expect(io).to receive(:puts).with("Frame No. 1, Roll No. 2")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("8")
      expect(game).to receive(:roll_pin).and_return(8)
      expect(game).to receive(:pins_rolled).and_return([[1,8],[],[],[],[],[],[],[],[],[]])
      expect(io).to receive(:puts).with([[1,8],[],[],[],[],[],[],[],[],[]])
      interface.run
    end
  end
end

require 'user_interface'
  
RSpec.describe UserInterface do
  describe 'app starts' do
    it 'greets users and asks users to input the first input when app starts' do
      io = double(:io)
      interface = UserInterface.new(io)
      expect(io).to receive(:puts).with("Welcome to the 🎳 Bowling Game")
      expect(io).to receive(:puts).with("I am here to keep your score!")
      expect(io).to receive(:puts).with("Frame No. 1, Roll No. 1")
      expect(io).to receive(:puts).with("Please enter the number of knocked down pins:")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with(1)
      interface.run
    end

    it 'keeps asking user if the input is wrong' do
      io = double(:io)
      interface = UserInterface.new(io)
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
      expect(io).to receive(:puts).with(10)

      interface.run
    end
  end
  
end

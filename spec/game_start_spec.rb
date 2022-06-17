require 'user_interface'
  
RSpec.describe UserInterface do
  describe 'app starts' do
    it 'greets users when app starts' do
      io = double(:io)
      interface = UserInterface.new(io)
      expect(io).to receive(:puts).with("Welcome to the 🎳 Bowling Game")
      expect(io).to receive(:puts).with("I am here to keep your score!")
      interface.run
    end
  end
end

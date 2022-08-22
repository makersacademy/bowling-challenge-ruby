require_relative '../../app'

RSpec.describe App do
  context 'player can enter a score' do
    xit 'returns the score at the end of every frame' do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to bowling!").ordered

      # Frame 1
      expect(io).to receive(:puts).with("Please enter the first number of knocked down pins:")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Please enter the second number of knocked down pins:")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Your score: 5 points")

      app = App.new(io)
      app.play
    end
  end
end
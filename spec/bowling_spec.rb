require_relative '../lib/bowling.rb'

RSpec.describe Bowling do
  context 'no rolls are logged by player' do
    it 'returns score of 0' do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      
      game = Bowling.new(io)
      expect(game.score).to eq 0
    end
  end

  context 'player logs 5 and 4 for first frame' do
    it 'returns score of 9' do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")
  
      game = Bowling.new(io)
      game.frame
      expect(game.score).to eq 9
    end
  end

  context 'player scores a strike' do
    it 'congratulates player' do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Strike!!")
  
      game = Bowling.new(io)
      game.frame
    end

    it "doubles player's next frame" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Strike!!")
      
      game = Bowling.new(io)
      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")

      game.frame
      expect(game.score).to eq 28
    end
  end

  context 'player scores two consecutive strikes' do
    it "doubles player's next two frames" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Strike!!")
      
      game = Bowling.new(io)
      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("10")
      expect(io).to receive(:puts).with("Strike!!")

      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")

      game.frame
      expect(game.score).to eq 48
    end
  end

  context 'player scores a spare' do
    it 'congratulates player' do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("6")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Spare!")
  
      game = Bowling.new(io)
      game.frame
    end

    it "doubles player's next roll" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("6")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Spare!")
      
      game = Bowling.new(io)
      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")

      game.frame
      expect(game.score).to eq 24
    end
  end

  context 'player scores two consecutive spares' do
    it "doubles first roll of player's next two frames" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to your bowling scorecard. Press any key to continue.")
      expect(io).to receive(:gets).and_return("Y")
      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("6")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Spare!")
      
      game = Bowling.new(io)
      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("6")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Spare!")

      game.frame

      expect(io).to receive(:puts).with("Please enter score for first roll:")
      expect(io).to receive(:gets).and_return("5")
      expect(io).to receive(:puts).with("Please enter score for second roll:")
      expect(io).to receive(:gets).and_return("4")

      game.frame
      expect(game.score).to eq 40
    end
  end
end
require 'game'
require 'frame'

describe Game do
  let(:io) { double(:io) }
  let(:game) { Game.new(double(:io)) }

  it "intializes with an array of 10 frames" do
    expect(game.frames.first).to be_an_instance_of Frame
    expect(game.frames.first.rolls.empty?).to eq true
    expect(game.frames.length).to eq 10
  end

  it "intializes with gutter_game? and perfect_game? set to false" do
    expect(game.gutter_game?).to eq false
    expect(game.perfect_game?).to eq false
  end

  it "scores a perfect game 300" do
    io = double(:io)
    for i in 1..10
      expect(io).to receive(:puts).with("Frame #{i}:")
      expect(io).to receive(:puts).with("Roll first ball:")
      expect(io).to receive(:gets).and_return('10')  
      expect(io).to receive(:puts).with("Strike!")
    end
    expect(io).to receive(:puts).with("Roll bonus ball:")
    expect(io).to receive(:gets).and_return('10')  
    expect(io).to receive(:puts).with("Roll second bonus ball:")
    expect(io).to receive(:gets).and_return('10')  
    game = Game.new(io)
    game.run_game
    game.calculate_score
    expect(game.grand_total).to eq 300
    expect(game.perfect_game?).to eq true
  end

  it "scores a gutter game 0" do
    io = double(:io)
    for i in 1..10
      expect(io).to receive(:puts).with("Frame #{i}:")
      expect(io).to receive(:puts).with("Roll first ball:")
      expect(io).to receive(:gets).and_return('0')  
      expect(io).to receive(:puts).with("Roll second ball:")
      expect(io).to receive(:gets).and_return('0') 
    end
    game = Game.new(io)
    game.run_game
    game.calculate_score
    expect(game.grand_total).to eq 0
    expect(game.perfect_game?).to eq false
    expect(game.gutter_game?).to eq true
  end

  it "scores an example game correctly" do
    io = double(:io)
    expect(io).to receive(:puts).with("Frame 1:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('1')  
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('4')  

    expect(io).to receive(:puts).with("Frame 2:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('4') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('5')  

    expect(io).to receive(:puts).with("Frame 3:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('6') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('4') 
    expect(io).to receive(:puts).with("Spare!") 

    expect(io).to receive(:puts).with("Frame 4:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('5') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('5')  
    expect(io).to receive(:puts).with("Spare!") 

    expect(io).to receive(:puts).with("Frame 5:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('10') 
    expect(io).to receive(:puts).with("Strike!")

    expect(io).to receive(:puts).with("Frame 6:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('0') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('1')  

    expect(io).to receive(:puts).with("Frame 7:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('7') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('3')  
    expect(io).to receive(:puts).with("Spare!") 

    expect(io).to receive(:puts).with("Frame 8:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('6') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('4')  
    expect(io).to receive(:puts).with("Spare!") 

    expect(io).to receive(:puts).with("Frame 9:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('10') 
    expect(io).to receive(:puts).with("Strike!")

    expect(io).to receive(:puts).with("Frame 10:")
    expect(io).to receive(:puts).with("Roll first ball:")
    expect(io).to receive(:gets).and_return('2') 
    expect(io).to receive(:puts).with("Roll second ball:")
    expect(io).to receive(:gets).and_return('8') 
    expect(io).to receive(:puts).with("Spare!")  
    expect(io).to receive(:puts).with("Roll bonus ball:")
    expect(io).to receive(:gets).and_return('6') 


    game = Game.new(io)
    game.run_game
    game.calculate_score
    expect(game.grand_total).to eq 133
    expect(game.perfect_game?).to eq false
    expect(game.gutter_game?).to eq false

  end
end
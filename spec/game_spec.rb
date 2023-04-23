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
  end

end
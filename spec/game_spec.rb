require "game"

describe Game do 
  let(:game) { Game.new }

  it "can create a Frame" do
    game.create_frame
    expect(game.frames.length).to eq 1
  end

  it "increments the Frame number" do
    game.create_frame
    expect(Frame).to receive(:new).with(2)
    game.create_frame
  end

  it "creates a frame to record the roll" do
    game.input_roll(4)
    expect(game.frames.length).to eq 1
  end

  it "creates another frame when the first is completed" do
    game.input_roll(10)
    game.input_roll(8)
    expect(game.frames.length).to eq 2
  end

  

end

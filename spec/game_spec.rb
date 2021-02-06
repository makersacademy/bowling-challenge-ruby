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

end

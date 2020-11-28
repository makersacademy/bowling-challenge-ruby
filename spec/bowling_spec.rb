require 'bowling'

describe Bowling do

  it "allows the user to enter their roll" do
    game = Bowling.new
    expect(game).to respond_to(:roll).with(1).argument
  end

end

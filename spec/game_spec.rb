require 'game'

describe Game do 
  let(:game) { Game.new }
  it 'asks for user input' do
    expect{ game.play }.to output("What is your roll?\n").to_stdout
  end
end
require 'scoreboard.rb'

describe "Scoreboard" do

let(:player) { Scoreboard.new("Paul")} 

  # it "can roll a gutter game" do
  #   20.times{player.roll(0)}
  #   expect(player.scoretry).to eq(0)
  # end

  # it "can roll all ones" do
  #   20.times{player.roll(1)}
  #   expect(player.scoretry).to eq(20)
  # end

  # it "can roll a spare" do
  #   player.roll(5)
  #   player.roll(5)
  #   player.roll(3)
  #   17.times{player.roll(0)}
  #   expect(player.scoretry).to eq(16)
  # end

  # it "should calculate the total score for a player" do
  #   player = Scoreboard.new("Paul")
  #   player.add_roll(frame: 3, roll1: 4, roll2: 2)
  #   player.add_roll(frame: 4, roll1: 6, roll2: 4)
  #   expect(player.generate_total).to eq(16)
  # end

  it "should generate a hash with points scored per frame" do
    player.add_roll(frame: 1, roll: [4, 5])
    player.add_roll(frame: 8, roll: [8, 1])
    expect(player.score).to eq("Paul" => {
      1 => [4, 5],
      2 => [0, 0],
      3 => [0, 0],
      4 => [0, 0],
      5 => [0, 0],
      6 => [0, 0],
      7 => [0, 0],
      8 => [8, 1],
      9 => [0, 0],
      10 => [0, 0]
      })
  end

  it "should generate a hash with the frames and 0 values for the runs each frame when a scoreboard is created" do
    expect(player.score).to eq("Paul" => { 
      1 => [0, 0],
      2 => [0, 0],
      3 => [0, 0],
      4 => [0, 0],
      5 => [0, 0],
      6 => [0, 0],
      7 => [0, 0],
      8 => [0, 0],
      9 => [0, 0],
      10 => [0, 0]
      })
  end

  it "can roll a spare" do
    player.add_roll(frame: 1, roll: [5, 5])
    player.add_roll(frame: 2, roll: [5, 0])
    expect(player.generate_total).to eq(20)
  end

  it "can roll a strike" do
    player.add_roll(frame: 1, roll: 10)
    player.add_roll(frame: 2, roll: [3, 5])
    expect(player.generate_total).to eq(26)
  end
end
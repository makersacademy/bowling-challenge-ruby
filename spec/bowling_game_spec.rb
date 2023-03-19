require 'bowling_game'

RSpec.describe BowlingGame do 
  it "creates a new instance of BowlingGame" do 
    new_player = BowlingGame.new
  end

  it "initially returns an empty score" do 
    player_1 = BowlingGame.new  
    expect(player_1.score).to eq 0
  end 

  it "can roll gutter game" do
    player_1 = BowlingGame.new 
    20.times {player_1.play(0)}
    expect(player_1.score).to eq 0
  end 

  it "can roll all ones" do
    player_1 = BowlingGame.new 
    20.times {player_1.play(1)} 
    expect(player_1.score).to eq 20
  end 

end  
require 'bowling_game'

RSpec.describe BowlingGame do 
  it "creates a new instance of BowlingGame" do 
    new_player = BowlingGame.new
  end

  it "initially returns an empty score" do 
    player_1 = BowlingGame.new  
    expect(player_1.score).to eq 0
  end 

end  
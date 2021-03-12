describe Game do

  let(:subject){Game.new(player_1_name: "player1", player_2_name: "player2")}

  it 'swaps player turn after #playmethod called' do
    subject.play(roll_1: 2, roll_2: 5)
    expect(subject.whos_turn).to eq("player_2")
  end

  # it "runs a 10 frame game" do
  #   subject.game_start
  # end



end

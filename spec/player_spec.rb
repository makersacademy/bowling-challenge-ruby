require 'player'

describe Player do

  let(:subject) {Player.new(name: "player1")}

  it 'adds the scores into hash' do
    subject.add_score(roll_1: 2, roll_2: 3, total: 5)
    subject.add_score(roll_1: 4, roll_2: 5, total: 9)
    expect(subject.score).to eq(
      [{roll_1: 2, roll_2: 3, total: 5},
      {roll_1: 4, roll_2: 5, total: 9}]
    )
  end

end

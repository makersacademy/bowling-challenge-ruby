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

  it "adds points after rolls" do
    subject.add_score(roll_1: 4, roll_2: 3, total: 7)
    subject.add_score(roll_1: 1, roll_2: 8, total: 9)
    subject.calculate()
    expect(subject.points).to eq(16)
  end

  it 'tracks the number of frames' do
    10.times {subject.add_score(roll_1: 4, roll_2: 3, total: 7)}
    expect(subject.frame_number).to eq(10)

  end

end

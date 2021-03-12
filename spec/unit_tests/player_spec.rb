describe Player do

  let(:subject) {Player.new(name: "player1")}

  it 'successfully adds the scores into a hash' do
    subject.add_score(roll_1: 1, roll_2: 5, total: 6)
    subject.add_score(roll_1: 5, roll_2: 2, total: 7)
    expect(subject.score).to eq(
      [{roll_1: 1, roll_2: 5, total: 6},
      {roll_1: 5, roll_2: 2, total: 7}]
    )
  end

  it "successfully adds the points after successive rols" do
    subject.add_score(roll_1: 1, roll_2: 5, total: 6)
    subject.add_score(roll_1: 5, roll_2: 2, total: 7)
    subject.calculate()
    expect(subject.points).to eq(13)
  end

  it 'keeps track of the number of frames' do
    10.times {subject.add_score(roll_1: 1, roll_2: 5, total: 6)}
    expect(subject.frame_number).to eq(10)

  end

  context "point & bonnus calcs after different bowling scenarios" do

    it "after 1 strike" do
      subject.add_score(roll_1: 10, total: 10)
      subject.add_score(roll_1: 4, roll_2: 3, total: 7)
      subject.calculate
      expect(subject.points).to eq(17)
      expect(subject.bonus).to eq(3+4)
    end

    it "after 2 strikes" do
      subject.add_score(roll_1: 10, total: 10)
      subject.add_score(roll_1: 10, total: 10)
      subject.add_score(roll_1: 4, roll_2: 3, total: 7)
      subject.calculate()
      expect(subject.points).to eq(27)
      expect(subject.bonus).to eq(10+7)
    end

    it "after a spare" do
      subject.add_score(roll_1: 5, roll_2: 5, total: 10)
      subject.add_score(roll_1:4, roll_2:3, total: 7)
      subject.calculate()
      expect(subject.points).to eq(17)
      expect(subject.bonus).to eq(4)
    end

    it "after a strike then a spare" do
      subject.add_score(roll_1: 10, total: 10)
      subject.add_score(roll_1: 5, roll_2:5, total: 10)
      subject.add_score(roll_1: 3, roll_2: 4, total: 7)
      subject.calculate()
      expect(subject.points).to eq(27)
      expect(subject.bonus).to eq(10+3)
    end

    it "after a spare then a strike" do
      spare()
      strike()
      subject.add_score(roll_1: 3, roll_2: 4,  total: 7)
      subject.calculate()
      expect(subject.points).to eq(27)
      expect(subject.bonus).to eq(10+3+4)
    end

    it "after a entire 10 frame game" do
      ten_frame_game
      subject.calculate()
      expect(subject.points).to eq(89)
      expect(subject.bonus).to eq(5+5+3+5+5+3+5+5+3)
    end

    it "after an entire 10 frame game with a strike at the end" do
      ten_frame_game_strike_end
      subject.add_score(roll_1:7, roll_2: 1, total: 8)
      subject.calculate()
      expect(subject.points).to eq(91)
      expect(subject.bonus).to eq(5+5+3+5+5+3+5+5+3+(7+1))
    end

  end
end

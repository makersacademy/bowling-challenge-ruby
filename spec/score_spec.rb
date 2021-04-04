require 'score'

describe Score do
  it 'responds to calculate' do
    expect(subject).to respond_to(:calculate)
  end
  it 'calls save_roll' do
    expect(subject).to receive(:save_roll)
    subject.calculate(1,1,1)
  end

  it 'calls calculate_bonus if the bonus is 1 or 2' do
    subject.calculate(1,1,1)
    expect(subject).to receive(:calculate_bonus)
    subject.calculate(1,1,1)
  end
  it "doesn't call calculate_bonus if the bonus is 0" do
    subject.calculate(1,1,0)
    expect(subject).not_to receive(:calculate_bonus)
    subject.calculate(1,1,0)
  end
  it "calls calculate_bonus_1_roll if roll2 = nil" do
    expect(subject).to receive(:calculate_bonus_1_roll)
    subject.calculate_bonus(8,nil)
  end
  it "sets @bonus_score_previous appropriately for frames 1-9" do
    subject.instance_variable_set(:@add_bonus, true)
    subject.calculate(10,10,2)
    expect(subject.instance_variable_get(:@bonus_score_previous)).to eql(10)
  end
  it "calculates the correct score if somebody rolls a strike" do
    subject.instance_variable_set(:@add_bonus, false)
    allow(subject).to receive(:calculate_bonus)
    subject.instance_variable_set(:@bonus_score, 0)
    allow(subject).to receive(:save_roll)
    expect(subject.calculate(10,nil,2)).to eq [10,0,0]
  end
  it "saves the rolls and bonus from a previous roll" do
    subject.save_roll(10,8,2)
    expect(subject.roll1).to eq 10
    expect(subject.roll2).to eq 8
    expect(subject.bonus).to eq 2
  end
  it "responds to calculate_frame10" do
    expect(subject).to respond_to(:calculate_frame10)
  end
  it "sets @bonus_score_previous appropriately for frames 1-9" do
    subject.instance_variable_set(:@add_bonus, true)
    subject.calculate_frame10(10,10,2)
    expect(subject.instance_variable_get(:@bonus_score_previous)).to eql(10)
  end
  it "calls calculate_bonus if the bonus isn't nil or zero" do
    subject.instance_variable_set(:@bonus, 1)
    expect(subject).to receive(:calculate_bonus)
    subject.calculate_frame10(10,0,2)
  end
  it "calls calculate_bonus_2_rolls if roll2 != nil" do
    expect(subject).to receive(:calculate_bonus_2_rolls)
    subject.calculate_bonus(8,8)
  end
  it "sets the bonus score to roll1 if a spare was previously rolled" do
    subject.instance_variable_set(:@bonus, 1)
    subject.calculate_bonus_2_rolls(10,10)
    expect(subject.instance_variable_get(:@bonus_score)).to eql(10)
  end
  it "sets the bonus score to roll1 + roll2 if a strike was previously rolled" do
    subject.instance_variable_set(:@bonus, 2)
    subject.calculate_bonus_2_rolls(10,10)
    expect(subject.instance_variable_get(:@bonus_score)).to eql(20)
  end
  it "sets the bonus score to roll1 if a spare was previously rolled" do
    subject.instance_variable_set(:@bonus, 1)
    subject.calculate_bonus_1_roll(10)
    expect(subject.instance_variable_get(:@bonus_score)).to eql(10)
  end
  it "sets the bonus score to roll1 if a strike was previously rolled and there's no roll 2" do
    subject.instance_variable_set(:@bonus, 2)
    subject.calculate_bonus_1_roll(10)
    expect(subject.instance_variable_get(:@bonus_score)).to eql(10)
    expect(subject.instance_variable_get(:@add_bonus)).to eql(true)
  end
end

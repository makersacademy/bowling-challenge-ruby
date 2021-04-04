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
  it "calculates the correct score" do
    subject.instance_variable_set(:@add_bonus, false)
    allow(subject).to receive(:calculate_bonus)
    subject.instance_variable_set(:@bonus_score, 0)
    allow(subject).to receive(:save_roll)
    expect(subject.calculate(10,nil,2)).to eq [10,0,0]
  end

end

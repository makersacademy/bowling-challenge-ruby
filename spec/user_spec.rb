require "user"

describe User do
  it "should accept an argument for the users name" do
    user = User.new('james')
    expect(user.name).to eq('james')
  end

  it "should able to pass a score to a scorecard object" do
    scorecard = double("scorecard")
    user_score = 5
    expect(scorecard).to receive(:add_score).with(5)

    user = User.new("james", scorecard)
    user.add_score(5)
  end


end
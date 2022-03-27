require "user"

describe User do
  it "should accept an argument for the users name" do
    user = User.new('james')
    expect(user.name).to eq('james')
  end


end
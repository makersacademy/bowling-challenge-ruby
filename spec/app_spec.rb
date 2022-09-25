require_relative '../app'


describe "App" do

  let (:app) { Application.new }

  it "should return 300 for a perfect game" do
    rolls = [10] * 12
    expect(app.score(rolls, 0, 0)).to eq(300)
  end

  it "should return 90 for a game of all 9s" do
    rolls = [7,2] * 10
    expect(app.score(rolls, 0, 0)).to eq(90)
  end

  it "should return 120 for a game of all spares" do
    rolls = [2,8] * 10
    rolls << 10
    expect(app.score(rolls, 0, 0)).to eq(128)
  end

end
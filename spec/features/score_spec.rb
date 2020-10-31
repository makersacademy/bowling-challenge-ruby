describe "score" do
  let(:f1) { Frame.new(number: 1) }
  let(:f2) { Frame.new(number: 2) }
  let(:f3) { Frame.new(number: 3) }
  let(:fx) { Frame.new(number: 10) }

  it "strike!" do
    f1.roll(10)
    expect(f1.score(f2, f3)).to eq 10
    f2.roll(4)
    f2.roll(5)
    expect(f1.score(f2, f3)).to eq 19
  end

  it "triple strike!" do
    f1.roll(10)
    f2.roll(10)
    f3.roll(10)
    expect(f1.score(f2, f3)).to eq 30
  end

  it "triple strike on the last frame!" do
    fx.roll(10)
    fx.roll(10)
    fx.roll(10)
    expect(fx.score).to eq 30
  end

  it "spare!" do
    f1.roll(7)
    f1.roll(3)
    f2.roll(8)
    f2.roll(1)
    expect(f1.score(f2, f3)).to eq 18
  end

  it "spare on the last frame!" do
    fx.roll(8)
    fx.roll(2)
    fx.roll(9)
    expect(fx.score).to eq 19
  end
end

describe BowlingScore do
  it 'hits 5 pins' do
    bowling = BowlingScore.new
    expect(bowling.hit(5)).to eq (5)
  end
end
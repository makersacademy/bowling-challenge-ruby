require './bowl'
RSpec.describe Bowl do

  it 'returns 0 for Gutter game' do
    arr = Array.new(10, [0, 0])
    bowl = Bowl.new
    expect(bowl.score(arr)).to eq 0
  end

  it 'returns a score of 20 for all ones' do
    arr = Array.new(10, [1, 1])
    bowl = Bowl.new
    expect(bowl.score(arr)).to eq 20
  end

  it 'gives a score of 16 case one spare - 5, 5 and 3 pins then 0 for the next 17 rolls' do
    arr = [[5,5], [3,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
    bowl = Bowl.new
    expect(bowl.score(arr)).to eq 16
  end


  it 'gives a score of 24 case one strike - a strike, 3 and 4 pins then 0 for the next 16 rolls' do
    arr = [[10], [3,4], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
    bowl = Bowl.new
    expect(bowl.score(arr)).to eq 24
  end
  
end
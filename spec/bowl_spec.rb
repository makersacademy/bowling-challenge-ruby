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
  
end
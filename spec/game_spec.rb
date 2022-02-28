require 'game'
describe Game do
#   describe '#score' do
#     it 'calculates the score' do
#       game = Game.new
#       20.times {game.hits(2)}
#       expect(game.score).to eq 40
#     end
#   end  
# end
it 'can do' do
  game = Game.new
  20.times{game.roll(0)}
  expect(game.score).to eq 0
end

end

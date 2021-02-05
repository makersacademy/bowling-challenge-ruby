describe Game do
  let(:game) { described_class.new }

   describe 'initialize' do
     it 'has two attributes score and frame' do
       expect(game).to respond_to(:frame, :score)
     end

     it 'score is an empty array' do
       expect(game.score).to be_empty
     end

     it 'frame is set to 0' do
       expect(game.frame).to eq(0)
     end
   end
end

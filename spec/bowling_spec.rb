require 'bowling'

describe BowlingGame do
	let(:game) {BowlingGame.new}
	before(:each) do
		@score = Array.new(10) {Array.new(2, 0)}
	end

	context "#initialization" do
		it 'creates an instance of the BowlingGame class' do
			expect(game).to be_a BowlingGame
		end

		it 'starts a game with a score of zero' do
			game_score = BowlingGame::STARTINGSCORE
			expect(game_score).to eq 0
		end

		it 'starts a game with an empty array with a length of 10' do
			expect(game.score.length).to eq 10
		end

	end

	describe "#roll" do
		it 'has a #roll method' do
			expect(game).to respond_to(:roll)
		end
		
		it 'takes `pins` as args and adds it to the score array with a total length of 10' do
			game.roll(7)
			game.roll(2)
			expect(game.score[0].length).to eq 2
		end
	end


end
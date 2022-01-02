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

	describe "#bonus_score" do
		it "calculates the bonus score from strikes & spares" do
			10.times {game.roll(10)}
			expect(game.bonus_score.flatten.compact.sum).to eq 200
		end
	end

	describe "#calc_score" do
		it 'has a #calc_score method' do
			expect(game).to respond_to(:calc_score)
		end

		it 'knows if the someone is having a perfect_game and calculates the score accordingly' do
			10.times{game.roll(10)}
			expect(game.calc_score).to eq 300
		end

		it "calculates the score based on user's results" do
			game.roll(1)
			game.roll(4)
			game.roll(4)
			game.roll(5)
			expect(game.calc_score).to eq 14
		end
	end


end
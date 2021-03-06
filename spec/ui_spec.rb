require 'ui'

describe Ui do

	describe '#initialize' do
		it 'initializes a game' do
			expect(subject.game).to be_a(Game)
		end

		it 'has a blank scoreboard' do
			expect(subject.scorecard).to be_empty
		end
	end

end
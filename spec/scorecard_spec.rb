require 'scorecard.rb'

describe Scorecard do
	it 'is an array of frames' do
		expect(subject).to respond_to(:score)
	end
end
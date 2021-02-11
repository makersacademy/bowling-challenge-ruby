require './lib/message'
describe Message do
let(:subject) { described_class.new(8, 2) }

  it "initializes with a knowledge of current score and pins" do
    expect(subject.score).to be 8
    expect(subject.pins).to be 2
  end
end

require 'spec_helper.rb'
require './bowling.rb'

describe Bowling do
  let(:bowling) { Bowling.new([[1,1]]) }

  it "accept an array" do
    bowling = Bowling.new([[1,4], [10]])
    expect(bowling.balls).to eq([[1,4], [10]])
  end

  it "count correctly" do
    bowling = Bowling.new([[4,7],[6,0]])
    expect(bowling.total).to eq(17)

    bowling = Bowling.new([[8,0],[2,1]])
    expect(bowling.total).to eq(11)

    bowling = Bowling.new([[8,4]])
    expect(bowling.total).to eq(12)

    bowling = Bowling.new([[1,2],[4,5],[4,4]])
    expect(bowling.total).to eq(20)

    bowling = Bowling.new([[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[4,4],[0,10],[4,0]])
    expect(bowling.total).to eq(86)

    bowling = Bowling.new([[5,4],[5,4],[5,4],[5,4],[5,4],[5,4],[5,4],[5,4],[5,4],[5,4],[10,0]])
    expect(bowling.total).to eq(90)

    bowling = Bowling.new([[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[1,1]])
    expect(bowling.total).to eq(215)

    bowling = Bowling.new([[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10]])
    expect(bowling.total).to eq(300)
  end
end
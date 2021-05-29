require './lib/bowling'
describe Bowling do
    describe '#frame' do
      it 'keeps track of the current frame' do
        bowling = Bowling.new

        expect(subject.frame).to be_between(1, 10)
      end
    end
end



require 'print'
require 'scorecard'

describe Print do
  describe 'prints turn' do
    let (:new_scorecard) {Scorecard.new("my team")}
    let (:new_print) {Print.new}
      it 'when given nested hash it returns all keys or turns' do
        expect{new_print.output({@team => {1.1=>0, 1.2=>2}})}.to output("Frame.Roll = 1.1 Pins knocked = 0\nFrame.Roll = 1.2 Pins knocked = 2\n").to_stdout
      end
  end
end

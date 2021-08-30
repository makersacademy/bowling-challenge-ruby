require 'game'
describe Game do



  describe "#initialize" do
    it "initializes with a start date, end date, user_id and space_id" do
      Game.stub(:new).and_return(true)

      expect(Game.new).to have_attributes(no_of_frames_completed: 0)
    end
  end





end
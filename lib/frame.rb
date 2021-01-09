class Frame
  describe "new" do
    it 'should respond to new with 3 arguments' do
      expect(Frame).to respond_to(:new).with(2).arguments
    end
  end

end

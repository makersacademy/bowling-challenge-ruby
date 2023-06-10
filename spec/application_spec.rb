require 'app'

RSpec.describe Application do
  it "creates the @frames array" do
    app = Application.new
    expect(app.return_frames.length).to eq 10
  end
end
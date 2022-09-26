require_relative './frame'
require_relative './scorecard'

class Game
  def initialize(io, scorecard)
    @io = io
    @scorecard = scorecard
  end

  def run
    @io.puts('Welcome')
  end
end

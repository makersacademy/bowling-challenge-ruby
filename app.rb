# app.rb is for manual testing only, it isn't tested or used

require_relative 'lib/frame'
require_relative 'lib/last_frame'
require_relative 'lib/scorecard'

scorecard = Scorecard.new(Kernel)
scorecard.player_name = 'Volo'
scorecard.game
# frozen_string_literal: true

use Rack::MethodOverride
require_relative 'scoreboard_app'
run BowlingScoreboard

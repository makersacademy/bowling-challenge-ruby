require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# SimpleCov Config goes ABOVE this line (before all other configuration)

require_relative './support/good_vibes'

RSpec.configure do |config|

  config.after(:suite) do
    # RSpec good vibes section
    puts "\n\e[33m#{GoodVibes.vibe_check}\e[0m"
  end
end

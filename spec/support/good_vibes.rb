# :nocov:
class GoodVibes
  if File.exist?(File.expand_path('good_vibes_pk.rb', File.dirname(__FILE__)))
    require_relative './good_vibes_pk'
    VIBES = GoodVibesPK::POSITIVE_AFFIRMATIONS
  else 
    VIBES = [
      "Everything is going to be alright"
    ].freeze
  end

  def self.vibe_check
    VIBES.sample
  end
end
# :nocov:


require 'rubocop/rake_test'
require 'rspec/core/rake_task'

Rubocop::RakeTest.new(:cop)
RSpec::Core::RakeTask.new(:spec)

task default: [:cop, :spec]

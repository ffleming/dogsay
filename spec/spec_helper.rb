def key_location
  spec = Gem::Specification.find_by_name('dogsay')
  File.join(spec.gem_dir, '.code_climate.secret')
end

def set_code_climate_key!
  ENV['CODECLIMATE_REPO_TOKEN'] = File.read key_location rescue nil
end

set_code_climate_key!

require 'simplecov'
require 'codeclimate-test-reporter'
SimpleCov.start
CodeClimate::TestReporter.start
require_relative '../lib/dogsay'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  # config.profile_examples = 5

  config.order = :random
  Kernel.srand config.seed
end

require 'rspec/its'
require 'reality'

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

Reality.configure(:demo)

#require_relative 'helpers/formatters'

RSpec.configure do |c|
  c.before do
    Reality::Modules.list.clear
    Reality::Definitions::MediaWiki.clear
  end
end

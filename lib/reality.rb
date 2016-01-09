require 'infoboxer'
require 'yaml'

module Reality
  require_relative 'config'
  require_relative 'reality/infoboxer_templates'

  # basic functionality
  %w[measure].each do |mod|
    require_relative "reality/#{mod}"
  end

  # entities
  %w[country weather].each do |mod|
    require_relative "reality/#{mod}"
  end
end

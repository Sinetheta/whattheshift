require_relative './rails_helper'

Capybara.javascript_driver = :selenium_chrome_headless

require 'visdiff/rspec'

RSpec.configure do |config|
  config.visdiff.enable
  config.visdiff.base_url = 'http://localhost:3000/api'
  config.visdiff.api_key = 'not-implemented'
  config.visdiff.revision_from_git!
end

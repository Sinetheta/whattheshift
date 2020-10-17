require_relative './rails_helper'

Capybara.javascript_driver = :selenium_chrome_headless

require 'visdiff/rspec'

RSpec.configure do |config|
  config.visdiff.enable
  config.visdiff.base_url = Figaro.env.visdiff_base_url
  config.visdiff.api_key = Figaro.env.visdiff_api_key
  config.visdiff.revision_from_git!
end

require_relative './rails_helper'

Capybara.javascript_driver = :selenium_chrome_headless

require 'visdiff/rspec'

RSpec.configure do |config|
  config.visdiff.enable
  config.visdiff.base_url = Figaro.env.visdiff_base_url
  config.visdiff.api_key = Figaro.env.visdiff_api_key
  if ENV['CI']
    config.visdiff.identifier = ENV['HEROKU_TEST_RUN_ID']
    config.visdiff.description = "Heroku test of #{ENV['HEROKU_TEST_RUN_BRANCH']} at #{ENV['HEROKU_TEST_RUN_COMMIT_VERSION']}"
  else
    config.visdiff.revision_from_git!
  end
end

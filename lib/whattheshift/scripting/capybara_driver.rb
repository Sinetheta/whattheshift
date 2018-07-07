require 'capybara'
require 'capybara/dsl'

module WhatTheShift
  module Scripting
    class CapybaraDriver
      include Capybara::DSL

      def initialize
        Capybara.register_driver :chrome_headless do |app|
          browser_options = ::Selenium::WebDriver::Chrome::Options.new
          browser_options.args << '--headless'
          chrome_binary_path = ENV.fetch('GOOGLE_CHROME_SHIM', nil)
          browser_options.binary = chrome_binary_path if chrome_binary_path
          Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
        end
        Capybara.current_driver = :chrome_headless
        Capybara.run_server = false
        Capybara.save_path = 'tmp/capybara'
      end

      def visit_url(url)
        visit(url)
      end

      def save_screenshot(image_name)
        page.save_screenshot(image_name)
      end
    end
  end
end

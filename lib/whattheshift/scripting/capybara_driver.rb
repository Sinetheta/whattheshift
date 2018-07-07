require 'capybara'
require 'capybara/dsl'

module WhatTheShift
  module Scripting
    class CapybaraDriver
      include Capybara::DSL

      def initialize
        Capybara.run_server = false
        Capybara.current_driver = :selenium_chrome_headless
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

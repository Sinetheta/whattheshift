require 'capybara'
require 'capybara/dsl'

module WhatTheShift
  module Scripting
    class CapybaraDriver
      include Capybara::DSL

      def initialize
        Capybara.current_driver = :chrome_headless
        Capybara.run_server = false
        Capybara.save_path = 'tmp/capybara'
      end

      def resize_to(width, height)
        current_window.resize_to(width, height)
      end

      def save_screenshot(image_name)
        page.save_screenshot(image_name)
      end

      def visit_url(url)
        visit(url)
      end
    end
  end
end

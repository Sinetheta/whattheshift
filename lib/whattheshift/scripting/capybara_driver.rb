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

      def as_full_height
        current_width = page.driver.browser.manage.window.size.width
        current_height = page.driver.browser.manage.window.size.height
        height = evaluate_script('document.documentElement.scrollHeight')
        resize_to(current_width, height)
        yield.tap { resize_to(current_width, current_height) }
      end

      def resize_to(width, height)
        current_window.resize_to(width, height)
      end

      def save_screenshot(image_name, is_full_height: false)
        if is_full_height
          as_full_height { page.save_screenshot(image_name) }
        else
          page.save_screenshot(image_name)
        end
      end

      def visit_url(url)
        visit(url)
      end
    end
  end
end

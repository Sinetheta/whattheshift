require 'whattheshift/scripting/image'

module WhatTheShift
  module Scripting
    class RunNavigationScript
      attr_reader :capybara_driver

      def initialize(capybara_driver)
        @capybara_driver = capybara_driver
      end

      # @param navigation_script [NavigationScript] a web script to execute
      # @return [Array<TmpImage>] a list of screenshots
      def call(navigation_script)
        capybara_driver.resize_to(1366, 768)
        navigation_script.destinations.map do |destination|
          Image.new(
            identifier: destination.description,
            fullpath: screenshot(destination.url, destination.full_height?)
          )
        end
      end

      private

      # Avoid collision with other screenshots
      def random_filename
        "screenshot-#{SecureRandom.urlsafe_base64}.png"
      end

      def screenshot(url, is_full_height)
        capybara_driver.visit url
        capybara_driver.save_screenshot(random_filename, is_full_height: is_full_height)
      end
    end
  end
end

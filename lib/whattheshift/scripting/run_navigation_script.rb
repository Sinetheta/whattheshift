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
            fullpath: screenshot(destination.url)
          )
        end
      end

      private

      # Avoid collision with other screenshots
      def random_filename
        "screenshot-#{SecureRandom.urlsafe_base64}.png"
      end

      def screenshot(url)
        capybara_driver.visit url
        capybara_driver.save_screenshot(random_filename)
      end
    end
  end
end

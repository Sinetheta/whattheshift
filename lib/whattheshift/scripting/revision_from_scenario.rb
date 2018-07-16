require 'whattheshift/scripting/run_navigation_script'

module WhatTheShift
  module Scripting
    class RevisionFromScenario
      attr_reader :capybara_driver, :scenario

      def initialize(capybara_driver, scenario)
        @capybara_driver = capybara_driver
        @scenario = scenario
      end

      def call(description = nil)
        images = script_runner.call(scenario.script)
        revision = Revision.create(revision_attributes(images, description))
        attach_images(revision, images)
        revision
      end

      private

      def attach_images(revision, image_uploads)
        revision.images.reject{ |image| image.image.attached? }.each do |image|
          image_upload = image_uploads.find{ |image_upload| image_upload.signature == image.signature }
          image.image.attach(io: File.open(image_upload.fullpath), filename: 'image.png')
        end
      end

      def identifier
        "#{scenario.name}-#{Time.now.iso8601}"
      end

      def images_attributes(images)
        images.map do |image|
          { identifier: image.identifier, signature: image.signature }
        end
      end

      def revision_attributes(images, description)
        {
          identifier: identifier,
          description: description,
          images_attributes: images_attributes(images),
          scenario: scenario
        }
      end

      def script_runner
        WhatTheShift::Scripting::RunNavigationScript.new(capybara_driver)
      end
    end
  end
end

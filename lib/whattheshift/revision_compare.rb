require_relative 'image_compare'

module WhatTheShift
  # Generates a comparison between two revisions by diffing all images
  class RevisionCompare
    attr_reader :image_compare

    # @param image_compare [RevisionCompare]
    def initialize(image_compare=ImageCompare.new)
      @image_compare = image_compare
    end

    # @param revision1 [Revision]
    # @param revision2 [Revision]
    # @return [Comparison]
    def call(revision1, revision2)
      Comparison.create(
        from_revision: revision1,
        to_revision: revision2,
        image_diffs: diff_images(revision1.images, revision2.images)
      )
    end

    private

    def diff_images(start_images, finish_images)
      start_images.reduce([]) do |diffs, before_image|
        after_image = finish_images.find_by(identifier: before_image.identifier)
        diffs << create_diff(before_image, after_image) if after_image
        diffs
      end
    end

    def create_diff(before_image, after_image)
      diff_io = image_compare.call(before_image.image, after_image.image)
      ImageDiff.create(before_image: before_image, after_image: after_image) do |diff|
        diff.image.attach(io: diff_io, filename: 'diff.png')
      end
    end
  end
end

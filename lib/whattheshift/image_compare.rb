require 'tempfile'

module WhatTheShift
  # Generates a diff between two images using MiniMagick
  class ImageCompare
    # @param attachment1 [ActiveStorage::Attachment]
    # @param attachment2 [ActiveStorage::Attachment]
    # @return [IO] image diff stream
    def call(attachment1, attachment2)
      path1 = tempfile(attachment1).path
      path2 = tempfile(attachment2).path
      out_path = Tempfile.new('compare').path
      compare(path1, path2, out_path)
      File.open(out_path)
    end

    private

    def tempfile(attached)
      file = Tempfile.new('binary')
      file.binmode
      file.write(attached.download)
      file
    end

    def compare(image1_path, image2_path, output_path)
      compare = MiniMagick::Tool::Compare.new(whiny: false)
      compare << image1_path << image2_path << output_path
      compare.call do |stdout, stderr, status|
        return stderr.present? ? stderr : output_path;
      end
    end
  end
end

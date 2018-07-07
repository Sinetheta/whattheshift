module WhatTheShift
  module Scripting
    class Image
      include ActiveModel::Model

      attr_accessor :identifier, :fullpath

      def signature
        @signature ||= IO.popen(['identify', '-format', '%#', '--', fullpath]) do |f|
          f.read
        end.strip
      end
    end
  end
end

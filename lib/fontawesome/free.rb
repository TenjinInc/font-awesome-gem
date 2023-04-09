# frozen_string_literal: true

require_relative 'free/version'
require 'pathname'

# Thin wrapper gem to deliver FontAwesome via RubyGems
module FontAwesome
   # Defines technology group types and accessors for them
   module Free
      ROOT = Pathname.new(__dir__) / 'font-awesome-src'

      # Retrieves the path to the files for the given technology group.
      #
      # @param [Symbol] type - One of: :css, :js, :less, :scss, :sprites, :svgs, :webfonts
      def self.source_path(type)
         directory = case type
                     when :css, :js, :less, :scss, :sprites, :svgs, :webfonts
                        ROOT / type.to_s
                     else
                        raise "Unknown FontAwesome group #{ type.to_s }. Must be one of: :css, :js, :less, :scss, :sprites, :svgs, :webfonts"
                     end

         directory.cleanpath.to_s
      end

      class << self
         alias [] source_path
      end
   end
end

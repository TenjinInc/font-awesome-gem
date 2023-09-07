# frozen_string_literal: true

require_relative 'free/version'
require 'pathname'

# Thin wrapper gem to deliver FontAwesome via RubyGems
module FontAwesome
   # Defines technology group types and accessors for them
   module Free
      # The root directory of all of the FontAwesome files
      ROOT = Pathname.new(__dir__) / 'font-awesome-src' / 'js-packages' / '@fortawesome' / 'fontawesome-free'

      # List of known technology types
      TYPES = %i[css js less scss sprites svgs webfonts].freeze

      # Retrieves the path to the files for the given technology type.
      #
      # @param [Symbol] type - One of the types defined in TYPES
      # @return [String] the path to files for that tech
      def self.source_path(type)
         unless TYPES.include? type
            raise UnknownTechTypeError,
                  "Unknown FontAwesome group #{ type }. Must be one of: #{ TYPES.join(', ') }"
         end

         directory = ROOT / type.to_s

         directory.cleanpath.to_s
      end

      class << self
         alias [] source_path
      end

      class UnknownTechTypeError < RuntimeError
      end
   end
end

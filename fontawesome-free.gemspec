# frozen_string_literal: true

require_relative 'lib/fontawesome/free/version'

Gem::Specification.new do |spec|
   spec.name    = 'fontawesome-free'
   spec.version = FontAwesome::Free::VERSION
   spec.authors = ['Robin Miller']
   spec.email   = ['robin@tenjin.ca']

   spec.summary               = 'Gem wrapper for FontAwesome Free edition'
   spec.description           = 'An unofficial gem wrapper for the free version of the FontAwesome icon library.'
   spec.homepage              = 'https://github.com/TenjinInc/font-awesome-gem'
   spec.license               = 'MIT'
   spec.required_ruby_version = '>= 2.7.0'

   spec.metadata['allowed_push_host'] = 'https://rubygems.org'

   spec.metadata['homepage_uri']          = spec.homepage
   spec.metadata['source_code_uri']       = 'https://github.com/TenjinInc/font-awesome-gem'
   spec.metadata['rubygems_mfa_required'] = 'true'

   # Specify which files should be added to the gem when it is released.
   # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
   spec.files = Dir.chdir(__dir__) do
      `git ls-files -z`.split("\x0").reject do |f|
         (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
      end
   end

   spec.bindir        = 'exe'
   spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
   spec.require_paths = ['lib']

   # Dependencies
   # spec.add_dependency "example-gem", "~> 1.0"

   spec.add_development_dependency 'rake', '~> 13.0'
   spec.add_development_dependency 'rspec', '~> 3.0'
   spec.add_development_dependency 'rubocop', '~> 1.0'
   spec.add_development_dependency 'simplecov', '~> 0.22'
end

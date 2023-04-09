# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
require 'pathname'
require_relative 'lib/fontawesome/free'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :fa do
   download_path = FontAwesome::Free::ROOT
   head_path     = download_path / '.git' / 'HEAD'

   directory download_path

   file head_path => [download_path] do
      `git clone https://github.com/FortAwesome/Font-Awesome.git #{ download_path.cleanpath }`
   end

   task update: [head_path] do
      Dir.chdir(download_path) do
         puts `git pull`

         current_version = `git tag | grep -v "[[:alpha:]]" | sort --version-sort | tail -1`

         warn <<~MSG
            FontAwesome: #{ current_version.strip }
            Gem:         #{ FontAwesome::Free::VERSION }
         MSG

         if current_version.strip != FontAwesome::Free::VERSION.strip
            warn 'The gem version is out of date. Update version.rb and run: bundle exec rake release'
         end
      end
   end
end

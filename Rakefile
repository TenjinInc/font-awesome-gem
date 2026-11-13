# frozen_string_literal: true

# No longer require bundle exec
Gem.use_gemdeps 'Gemfile'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
require 'pathname'
require_relative 'lib/fontawesome/free'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :fa do
   project_source = 'https://github.com/FortAwesome/Font-Awesome.git'
   download_path  = FontAwesome::Free::ROOT

   directory download_path do
      system('git', 'submodule', 'add', project_source, download_path.cleanpath.to_s) ||
         raise('Failed to init git submodule.')
   end

   task update: [download_path] do
      Dir.chdir(download_path.cleanpath) do
         warn "cd into: #{ pwd }"

         warn 'Fetching FontAwesome updates...'
         # default branch is the most recent release
         `git pull`

         current_version = Gem::Version.new(`git tag | grep -v "[[:alpha:]]" | sort --version-sort | tail -1`)

         warn <<~MSG
            FontAwesome: #{ current_version }
            Gem:         #{ Gem::Version.new(FontAwesome::Free::VERSION) }
         MSG

         if current_version.version == '0'
            warn 'Error: Cannot parse FontAwesome source version.'
            exit 1
         end

         if current_version > FontAwesome::Free::VERSION
            warn 'There is a new version of FontAwesome. Update version.rb and run: bundle exec rake release'
         else
            warn 'Looks like everything is up to date.'
         end
      end
   end
end

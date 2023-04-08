# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'
require 'pathname'

RuboCop::RakeTask.new

task default: %i[spec rubocop]

namespace :fa do
   download_path     = Pathname.new(__dir__) / 'lib' / 'font_awesome'
   download_git_path = download_path / '.git'

   directory download_path

   file download_path / '.git' / 'HEAD' do
      `git clone https://github.com/FortAwesome/Font-Awesome #{ download_path.cleanpath }`
   end

   task update: [download_git_path] do
      Dir.chdir(download_path) do
         `git pull`
      end
   end
end

# frozen_string_literal: true

SimpleCov.configure do
   coverage_dir '.coverage'

   enable_coverage :branch

   root __dir__
end

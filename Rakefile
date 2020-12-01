require "rake/testtask"

Rake::TestTask.new do |t|
  t.test_files = FileList["test/**/*.rb"]
end
desc "Run tests"

task :main do
  require_relative("main")
end

task default: :main
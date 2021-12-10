require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.test_files = Dir.glob("test/**/test_*.rb")
  t.libs << "test"
end

task default: :test

desc "Launch an IRB console with the gem loaded"
task :console do
  require "irb"
  require "irb/completion"
  require "activemodel-email_address_validator"
  ARGV.clear
  IRB.start
end

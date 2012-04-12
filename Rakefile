# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sqoop-ruby"
  gem.homepage = "http://github.com/seeingidog/sqoop-ruby"
  gem.license = "MIT"
  gem.summary = %Q{Simple Ruby wrapper for Sqoop JDBC <-> HDFS import/export tool}
  gem.description = %Q{Simple Ruby wrapper for Sqoop JDBC <-> HDFS import/export tool}
  gem.email = "ian@ruby-code.com"
  gem.authors = ["Ian Morgan"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new


task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sqoop-ruby #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

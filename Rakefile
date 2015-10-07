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
  gem.name = "epiphan_pearl"
  gem.homepage = "https://github.com/wooga/epiphan-pearl.gem"
  gem.license = "MIT"
  gem.summary = %Q{Provide a very thin wrapper above the epiphan pearl third party API.}
  gem.description = %Q{Provide a very thin wrapper above the epiphan pearl third party API.}
  gem.email = "tobias.wermuth@wooga.net"
  gem.authors = ["Tobias Wermuth"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

desc "Start a pry shell and load all gems"
task :shell do
  require 'pry'
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
  require_relative 'lib/epiphan_pearl'
  Pry.editor = "emacs"
  Pry.start
end

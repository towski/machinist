$:.unshift(File.dirname(__FILE__) + '/../lib')

RAILS_ENV = "test"
require 'rubygems'
require 'init'
require 'test/unit'
require 'active_record'
require 'test/unit'
require 'spec'
require 'ruby-debug'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'sqlite3'])
load(File.dirname(__FILE__) + "/schema.rb")

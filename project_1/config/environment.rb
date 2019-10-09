
require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require File.join File.dirname(__FILE__), '../app/models/appointment'
require File.join File.dirname(__FILE__), '../app/models/patient'
require File.join File.dirname(__FILE__), '../app/models/physician'
# require_relative '../app/models/appointment'
# require_relative '../app/models/patient'
# require_relative '../app/models/physician'                                                                                                                                      09
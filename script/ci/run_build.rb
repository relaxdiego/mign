#!/usr/bin/env ruby
# This file is referenced by APP_ROOT/.travis.yml

require 'rubygems'
require 'yaml'

db_config = {}

db_config['postgres'] = {
  'adapter' => 'postgresql',
  'database' => 'migntest',
  'username' => 'postgres',
}

db_config['mysql'] = {
  'adapter' => 'mysql2',
  'database' => 'migntest',
  'username' => 'root',
  'encoding' => 'utf8',
}

File.open("#{File.dirname(__FILE__)}/../../config/database.yml", 'w' ) do |out|
  YAML.dump(db_config, out)
end
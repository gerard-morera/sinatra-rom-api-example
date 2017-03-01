require 'rack/cache'
require 'redis-rack-cache'

require File.join(File.dirname(__FILE__), 'lib/app.rb')

use Rack::Cache,
  verbose:     true,
  metastore:   'redis://localhost:6379/0/metastore',
  entitystore: 'redis://localhost:6380/0/entitystore'

run App

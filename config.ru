require './server'
require 'rack-rewrite'

use Rack::Rewrite do
  r301 %r{.*}, 'http://greenhummerproject.org$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != 'greenhummerproject.org' and ENV['RACK_ENV'] == 'production'
  }
end

run Sinatra::Application

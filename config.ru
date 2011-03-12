# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
# while recommended in using Compass /tmp setting, 
# this causes the application to not be able to look in /public
# for truly static resources (i.e. jQuery CSS themes ).
#use Rack::Static, :urls => ['/stylesheets'], :root => 'tmp'
run PackLeader::Application

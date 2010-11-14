#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm.rb'

get '/' do
	haml :index
end

get '/about' do
  haml :about
end

#stylesheets
get '/style.css' do
  #header 'Content-Type' => 'text/css; charset=utf-8'
  sass :'sass/style'
end

get '/handheld.css' do
  #header 'Content-Type' => 'text/css; charset=utf-8'
  sass :'sass/handheld'
end

#error routing
not_found do
  haml :'404'
end

error do
  haml :'500'
end
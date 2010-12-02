#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-types'
require 'dm-migrations'
# A MySQL connection:
DataMapper.setup(:default, 'mysql://hspc:bidgoli123@localhost/hspc')

class Problem
  include DataMapper::Resource
  property :id,                   Serial
  property :description,          Text
  property :input,                Text
  property :output,               Text
  
  has n, :Solution

  def register()

  end

  def lookup()

  end

end

class Competition
  include DataMapper::Resource

  property :id,       Integer,  :key => true
  property :name,                 String,   :length => 35
  property :date,                 DateTime
  property :type,                 Enum[:test, :school]
  property :duration,             Integer
  property :location,             String
end

class ProblemSet
  include DataMapper::Resource
  property :id, Integer, :key =>true
  
  belongs_to :Problem ,      :key => true
  has n, :Competition 
end

class FAQ
  include DataMapper::Resource

  property :id,                   Integer, :key => true
  property :question,             Text
  property :answer,               Text
  property :status,               Enum[:active, :inactive]
end

class School
  include DataMapper::Resource
  property :id,                   Integer, :key => true
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 135
  property :address2,              String,   :length => 135
  property :status,               Enum[:active, :inactive]
  property :phone,                String,   :length => 13
  property :code,                 String,   :length => 8

end

class Zip
  include DataMapper::Resource
  property :code,                 Integer, :key => true
  property :city,                 String
  property :state,                String

  has n, :School
end

class Coach
  include DataMapper::Resource

  property :id,                   Integer,  :key => true
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 45
  property :email,                String,   :length => 45
  property :shirt_size,           Enum[:XS, :S, :M, :L, :XL, :XXL]
  property :phone,                String,   :length => 13
  property :password,             String,   :length => 32
end  
  
class Participant
  include DataMapper::Resource

  property :id,       Integer,  :key => true
  property :name,                 String,   :length => 45
  property :email,                String,   :length => 45
  property :shirt_size,           Enum[:XS, :S, :M, :L, :XL, :XXL]
  property :password,             String,   :length => 32

  belongs_to :team
end

class Team
  include DataMapper::Resource

  property :id,      Integer,  :key => true
  property :name,    String,   :length => 45
  property :type,    Enum[:school, :test]

  belongs_to :Coach
  belongs_to :School
  belongs_to :Competition
end

class Solution
  include DataMapper::Resource
  property :id, Serial
  property :code, Text
  
end

class Language
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  
  has n, :Solution
end

DataMapper.finalize
#DataMapper.auto_migrate!

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/addteam' do
  haml :addteam
end

#stylesheets
get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'sass/style'
end

get '/handheld.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'sass/handheld'
end

#error routing
not_found do
  haml :'404'
end

error do
  haml :'500'
end

#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-types'
require 'dm-migrations'
# A MySQL connection:
DataMapper.setup(:default, 'mysql://hspc:bidgoli123@localhost/hspc')

class Competition
  include DataMapper::Resource

  property :competition_id,       Integer,  :key => true
  property :name,                 String,   :length => 35
  property :date,                 DateTime
  property :type,                 Enum[:test, :school]
  property :duration,             Integer
  property :location,             String
  
  has 1, :problem_sets,           Integer
end

class FAQ
  include DataMapper::Resource

  property :faq_id,               Integer, :key => true
  property :question,             Text
  property :answer,               Text
  property :status,               Enum[:active, :inactive]
end

class Participant
  include DataMapper::Resource

  property :participant_id,       Integer,  :key => true
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 45
  property :email,                String,   :length => 45
  property :role,                 Enum[:coach, :contestant]
  property :shirt_size,           Enum[:XS, :S, :M, :L, :XL, :XXL]
  property :phone,                String,   :length => 13
  property :password,             String,   :length => 32
  
  belongs_to :team
end

class Problem
  include DataMapper::Resource

  property :problem_id,           Integer, :key => true
  property :description,          Text
  property :input,                Text
  property :output,               Text
  
  belongs_to :problem_sets
end

class Problem_Set
  include DataMapper::Resource

  property :problem_id,           Integer, :key => true
  property :problem_set,          Integer, :key => true
end

class School
  include DataMapper::Resource
  property :school_id,            Integer, :key => true
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 135
  property :status,               Enum[:active, :inactive]
  property :phone,                String,   :length => 13
end

class Team
  include DataMapper::Resource

  property :participant_id,      Integer,  :key => true
  property :name,                String,   :length => 45
  property :coach,               Integer
  property :competition_id,      Integer
  property :member1,             Integer
  property :member2,             Integer
  property :member3,             Integer
  property :type,                Enum[:school, :test]
end

DataMapper.auto_upgrade!

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
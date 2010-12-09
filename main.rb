#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-types'
require 'dm-migrations'
require 'prawn'

# A MySQL connection:
DataMapper.setup(:default, 'mysql://hspc:bidgoli123@localhost/hspc')

class Problem
  include DataMapper::Resource
  property :id,                   Serial
  property :description,          Text
  property :input,                Text
  property :output,               Text
  has n, :Solution
end

class Competition
  include DataMapper::Resource
  property :id,                   Serial
  property :name,                 String,   :length => 35
  property :date,                 Date
  property :deadline,             Date
  property :type,                 Enum[:test, :school]
  property :duration,             Integer
  property :location,             String
  property :chair,                String
  property :chair_email,          String
end

class ProblemSet
  include DataMapper::Resource
  property :id,                   Integer, :key =>true
  belongs_to :Problem,            :key => true
  has n, :Competition 
end

class FAQ
  include DataMapper::Resource
  property :id,                   Serial
  property :question,             Text
  property :answer,               Text
  property :status,               Enum[:active, :inactive]
end

class School
  include DataMapper::Resource
  property :id,                   Serial
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 135
  property :address2,             String,   :length => 135
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
  property :id,                   Serial
  property :name,                 String,   :length => 45
  property :address,              String,   :length => 45
  property :email,                String,   :length => 45
  property :shirt_size,           Enum[:XS, :S, :M, :L, :XL, :XXL]
  property :phone,                String,   :length => 13
  property :password,             String,   :length => 32
end  
  
class Participant
  include DataMapper::Resource
  property :id,                   Serial
  property :name,                 String,   :length => 45
  property :email,                String,   :length => 45
  property :shirt_size,           Enum[:XS, :S, :M, :L, :XL, :XXL]
  property :password,             String,   :length => 32
  belongs_to :team
end

class Team
  include DataMapper::Resource
  property :id,                   Integer,  :key => true
  property :name,                 String,   :length => 45
  property :type,                 Enum[:school, :test]
  property :password,             String,   :length => 8
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
#warning, auto_migrate will drop all the current tables from the DB
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

get '/competition/:compid' do 
  competition = Competition.get(params[:compid])

  @name = competition.name
  @location = competition.location
  @date = competition.date
  @deadline = competition.deadline
  @duration = competition.duration
  @chair = competition.chair
  @chair_email = competition.chair_email
  haml :competition_overview
end

get '/competition/:compid/invite' do 
  competition = Competition.get(params[:compid])
  
  Prawn::Document.generate("invites.pdf") do
    text "generated at: "
    text Time.now.inspect
    schools = School.all
    schools.each do |school|
      start_new_page
      bounding_box [25,675], :width => 400 do
        text "Attention: Advisor or Computer Science Instructor"
        text school.name
        text school.address
        text school.address2
      end
      text "To whom it May Concern,\n\n\The Association for Computing Machinery(ACM) at Saginaw Valley State University will be conducting the High School Programming Competition on #{competition.date}. This contest has been an annual event hosted by the ACM student chapter at SVSU for over two decades. We are extended an invitation to your high school to attend this year's competition.\n\nThis year we hope to expand our competition to more Michigan schools. Even if your school does not have any computer programming classes, you may be surprised to find out that some of your students can indeed program. We ask that you post our flyer in any of your computer classes or mathematics classes. Hopefully, this may spark sme interest in your school's young programmers to come out and show nt only us, but other local students what they can do. Teams consist of up to three students. Multiple teams from each school are encouraged. T-shirts, continental breakfast, and lunch are included for free. Plaques are given to the top contenders, as are assorted prizes donated by local businesses.\n\nThis year the programming contest will support Gnu C++, Java, and Python. All programs are expected to be command line programs, read stdin for the input and output to stdout. Contest rules can be found on the competition's website (http://acm.svsu.edu/hspc). Registration begins immediately via our online registration using your school's id number listed below. Registration must be received by #{competition.deadline}\n\nSchool ID: #{school.code}\n\nThank you for your time and we hope to see your school at the upcoming programming contest. If you have any questions, please email me, #{competition.chair}, at #{competition.chair_email}. \n\nSincerely yours, \n\n#{competition.chair}\nHigh School Programming Competition Chairperson\nAssociation for Computing Machinery at SVSU"
      #puts school.name
    end
  end
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


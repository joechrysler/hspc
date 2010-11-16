require 'dm-core'
require 'dm-types'

# A MySQL connection:
DataMapper.setup(:default, 'mysql://localhost/hspc')

class Competition
  include DataMapper::Resource

  property :competition_id,       Serial
  property :name,                 String
  property :date,                 DateTime
  property :type,                 Enum[:Test, :School]
  property :duration,             Integer
  property :location,             string
  property :problem_set           In
end

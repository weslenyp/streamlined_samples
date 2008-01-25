class User < ActiveRecord::Base
  validates_presence_of :username
  validates_numericality_of :age
end

class HomeState < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :teams
end

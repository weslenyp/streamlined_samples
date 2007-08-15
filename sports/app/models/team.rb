puts caller.join("\n")

class Team < ActiveRecord::Base
  has_one :coach
  belongs_to :home_state
  has_many :players
  validates_presence_of :name
  
  module Sport
    SPORTS = %w{ Baseball Basketball Hockey Soccer Curling }
  end
end

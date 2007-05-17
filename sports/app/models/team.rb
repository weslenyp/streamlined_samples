class Team < ActiveRecord::Base
  has_one :coach
  has_many :players

  module Sport
    SPORTS = %w{ Baseball Basketball Hockey Soccer Curling }
  end
end

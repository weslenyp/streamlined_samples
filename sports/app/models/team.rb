class Team < ActiveRecord::Base
  has_one :coach

  module Sport
    SPORTS = %w{ Baseball Basketball Hockey Soccer Curling }
  end
end

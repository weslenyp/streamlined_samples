class Team < ActiveRecord::Base
  has_one :coach
  belongs_to :home_state
  has_many :players
  validates_presence_of :name
  
  module Sport
    SPORTS = %w{ Baseball Basketball Hockey Soccer Curling }
  end
  
  module Ranking
    RANKINGS = { "Insane" => 5, "Good" => 4, "Fair" => 3, "Mediocre" => 2, "Poor" => 1 }
  end
end

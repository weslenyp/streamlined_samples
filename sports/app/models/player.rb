class Player < ActiveRecord::Base
  belongs_to :team
  has_many :sponsors, :as => :spokesperson
  has_and_belongs_to_many :fantasy_teams
end

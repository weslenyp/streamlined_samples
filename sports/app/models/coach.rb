class Coach < ActiveRecord::Base
  belongs_to :team
  has_many :sponsors, :as => :spokesperson
end

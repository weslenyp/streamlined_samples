class Coach < ActiveRecord::Base
  belongs_to :team
  has_many :sponsors, :as => :spokesperson
  validates_presence_of :first_name, :last_name
end

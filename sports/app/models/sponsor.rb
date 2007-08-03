class Sponsor < ActiveRecord::Base
  belongs_to :spokesperson, :polymorphic => true
end

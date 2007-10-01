module Admin
  class PlayersController < ApplicationController
    layout "streamlined"  
    acts_as_streamlined
  end
end
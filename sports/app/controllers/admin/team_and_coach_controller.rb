module Admin
  class TeamAndCoachController < ApplicationController
    layout "streamlined"
    acts_as_streamlined 
    streamlined_ui("Team", :context => :and_coach) do
      user_columns :coach, {:filter_column => :last_name}
    end
  end
end
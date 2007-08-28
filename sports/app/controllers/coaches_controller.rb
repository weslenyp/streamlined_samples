class CoachesController < ApplicationController
  layout "streamlined"
  acts_as_streamlined
  
  # Redirects back to the show view instead of the list view when done editing a coach.
  # Note that for this to work, AJAX must be disabled on submit. See the CoachUI class
  # for an example of how this is done.
  render_filter :update, :success => Proc.new { redirect_to :action => "show", :id => params[:id] }
end

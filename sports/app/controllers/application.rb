# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_sports_session_id'
  
  if Rails::VERSION::MAJOR >= 2
    # See ActionController::RequestForgeryProtection for details
    # Uncomment the :secret if you're not using the cookie session store
    protect_from_forgery # :secret => '8ef71bb3dbb6661eaa92de82e6c1e68d'
  end
end

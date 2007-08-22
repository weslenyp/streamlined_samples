# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # This defines the menu system used across the top of every view.
  # It must be an array of arrays, each of which contains the title
  # of the button and the URL parameters for the link.
  def streamlined_top_menus
    [
      ["Teams", { :controller => "teams", :action => "index" }],
      ["Coaches", { :controller => "coaches", :action => "index" }],
      ["Players", { :controller => "players", :action => "index" }],
      ["Home States", { :controller => "home_states", :action => "index"}]
    ]
  end

#  def advanced_filtering
#    true
#  end  

  def breadcrumb
    true
  end  
end

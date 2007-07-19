# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def streamlined_top_menus
    [
      ["Teams", { :controller => "teams", :action => "index" }],
      ["Coaches", { :controller => "coaches", :action => "index" }],
      ["Players", { :controller => "players", :action => "index" }]
    ]
  end

#  def advanced_filtering
#    true
#  end  
end

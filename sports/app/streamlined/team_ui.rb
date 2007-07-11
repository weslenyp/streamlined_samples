module TeamAdditions 
  def personnel
    30
  end
end

Team.class_eval {include TeamAdditions}

class TeamUI < Streamlined::UI
  user_columns  :name, { :html_options => { :class => "team_input_field" }, :link_to => {:action => 'show'}},
                :city, { :html_options => { :class => "team_input_field", :size => 20 }},
                :sport, { :create_only => true, :enumeration => Team::Sport::SPORTS },
                :coach,
                :players,
                :personnel
end
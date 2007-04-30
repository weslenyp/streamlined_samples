module TeamAdditions 
  def personnel
    30
  end
end

Team.class_eval {include TeamAdditions}

class TeamUI < Streamlined::UI
  
  user_columns  :name,
                :city,
                :sport, { :create_only => true, :enumeration => Team::Sport::SPORTS },
                :coach,
                :personnel
end
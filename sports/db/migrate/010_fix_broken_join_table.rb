class FixBrokenJoinTable < ActiveRecord::Migration
  def self.up
    drop_table :fantasy_teams_players
    create_table :fantasy_teams_players, :id => false do |t|
      t.references :fantasy_team
      t.references :player
    end
  end

  def self.down
    create_table "fantasy_teams_players", :force => true do |t|
      t.integer "fantasy_team_id"
      t.integer "player_id"
    end
    drop_table :fantasy_teams_players
  end
end

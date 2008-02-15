class CreateFantasyTeamsAndJoinToPlayers < ActiveRecord::Migration
  def self.up
    create_table :fantasy_teams do |t|
      t.string :name
      t.timestamps
    end
    create_table :fantasy_teams_players do |t|
      t.references :fantasy_team
      t.references :player
    end
  end

  def self.down
    drop_table :fantasy_teams_players
    drop_table :fantasy_teams
  end
end

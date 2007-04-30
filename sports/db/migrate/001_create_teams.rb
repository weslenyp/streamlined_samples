class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.column :name, :string
      t.column :city, :string
      t.column :sport, :string
    end
  end

  def self.down
    drop_table :teams
  end
end

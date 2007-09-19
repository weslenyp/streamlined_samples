class AddAnnualSalesToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :annual_sales, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :teams, :annual_sales
  end
end

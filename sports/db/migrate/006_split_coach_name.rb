class SplitCoachName < ActiveRecord::Migration
  def self.up
    add_column :coaches, :first_name, :string
    add_column :coaches, :last_name, :string
    add_column :coaches, :middle_name, :string
    remove_column :coaches, :name
  end

  def self.down
    remove_column :coaches, :first_name
    remove_column :coaches, :last_name
    remove_column :coaches, :middle_name
    add_column :coaches, :name, :string
  end
end

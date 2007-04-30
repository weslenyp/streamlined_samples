class CreateCoaches < ActiveRecord::Migration
  def self.up
    create_table :coaches do |t|
      t.column :name, :string
      t.column :team_id, :integer
    end
  end

  def self.down
    drop_table :coaches
  end
end

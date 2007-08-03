class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.column :name, :string
      t.column :spokesperson_type, :string
      t.column :spokesperson_id, :integer
    end
  end

  def self.down
    drop_table :sponsors
  end
end

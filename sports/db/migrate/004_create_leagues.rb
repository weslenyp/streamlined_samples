class CreateLeagues < ActiveRecord::Migration
  def self.up
    create_table :leagues do |t|
      t.column :name, :string
    end  
  end

  def self.down
  end
end

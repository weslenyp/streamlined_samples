class CreateHomeStates < ActiveRecord::Migration
  def self.up
    create_table :home_states do |t|
      t.column :name, :string
    end
    add_column :teams, :home_state_id, :integer
  end

  def self.down
    drop_table :home_states
    remove_column :teams, :home_state_id
  end
end
